# Windows Qemu Test Setup

How to configure windows to run under qemu for test automation.

1. Get a copy of windows install media.
2. Create a qemu `qcow2` disk image.

   ```
   qemu-img create -f qcow2 windows.img 10G
   ```

3. Start qemu and install windows

   NOTE: you can use `qemu-system-i386` if you're installing 32-bit windows.

   ```
   qemu-system-x86_64 -M pc -m 4G \
       -usb -device usb-tablet \
       -hda windows.img \
       -cdrom ${your_windows_install_iso}
   ```

   - Set the user name to something like `test_user`.
   - Set the computer name to something like `test-platform`.

4. After the install completes, shut down and snapshot the disk image.

   This will create a named disk snapshot you can restore in the event
   you make an error in any of the subsequent steps.

   ```
   qemu-img snapshot -c post_install windows.img
   ```

5. Add serial ports and a qemu `vvfat` disk and install additional drivers.

   The CRT test rules will use the emulated PC's com ports to communicate
   the stdout and stderr streams and the exit code.  The test rules will
   use the `vvfat` disk to inject the test programs into the windows VM.

   NOTE: The file `qemupciserial.inf` comes from the qemu repository.  You
   will need this file so that Windows will recognize the `com3:` device. 
   Installation of drivers from `inf` files has changed over the years; in
   Windows 7, you'll need to use Device Manager to install this driver.


   ```
   # This is just a temporary path for the vvfat disk and
   # com-port files.  Test automation will create these paths
   # when running a test.
   mkdir -p /tmp/qemu/disk
   cp ${qemu}/docs/qemupciserial.inf /tmp/qemu/disk
   
   qemu-system-x86_64 -M pc -m 4G \
       -usb -device usb-tablet \
       -hda windows.img \
       -drive file=fat:rw:/tmp/qemu/disk,format=raw \
       -chardev file,id=com3,path=/tmp/qemu/exitcode \
       -serial file:/tmp/qemu/stdout \
       -serial file:/tmp/qemu/stderr \
       -device pci-serial,chardev=com3
   
   # Once you've installed the driver software. Shutdown and snapshot:
   qemu-img snapshot -c drivers windows.img
   ```

6. Enable auto-login for your test user.

   - For Windows 7:
      - Start the VM.
      - Run `control userpasswords2`
      - Select the `test_user` account.
      - Clear the "Users must enter a user name and password" checkbox.
      - Apply.  Enter the password.
      - Shutdown/Restart and confirm auto-login.
      - Shutdown and make a disk snapshot.
        ```
        qemu-img snapshot -c autologin windows.img
        ```

7. Create an auto-run script that will execute the bazel-injected tests.

   - Start the VM.
   - Open the `All Programs | Startup` folder.
   - Create a file named `run.bat` with the following contents:
     ```
     e:
     __test__.bat
     ```
   - Shutdown/Restart and confirm that `run.bat` executes.
   - Shutdown and make a disk snapshot.
     ```
     qemu-img snapshot -c autorun windows.img
     ```

8. In the same directory as your `windows.img` add a workspace configuration.

- `WORKSPACE.bazel`:
   ```
   workspace(name = "prebuilt")
   ```

- `BUILD.bazel`:
   ```
   package(default_visibility = ["//visibility:public"])
   
   exports_files(glob(["**"]))
   
   ```

9. In the repository where you want to create tests for windows binaries:

- `WORKSPACE.bazel`:
   ```
   local_repository(
       name = "prebuilt",
       path = "/path/to/your/prebuild/subdir"
   )
   
   # And, when you call `crt_deps`, tell it about your disk images
   # You may specify either `win64_disk_image` or `win32_disk_image` (or both).
   crt_deps(
       win64_disk_image = "@prebuilt//:windows64.img",
       win32_disk_image = "@prebuilt//:windows32.img",
   )
   ```

- To define a test, in a BUILD file:

   ```
   load("@crt//rules:run.bzl", "platform_test")
   
   platform_test(
       name = "some_windows_test",
       binary = ":some_cc_test_label",
   
       # Available windows execution platforms:
       # - @crt//platforms/x86_64:qemu_windows - Execute on 64-bit windows.
       # - @crt//platforms/x86_32:qemu_windows - Execute on 32-bit windows.
       exec_config = "@crt//platforms/x86_64:qemu_windows",
   
       # Available windows build platforms:
       # - @crt//platforms/x86_64:win64 - Modern 64-bit Windows.
       # - @crt//platforms/x86_32:win32 - Legacy 32-bit Windows.
       platform = "@crt//platforms/x86_64:win64",
   
       # Optional: if you say `local=True`, a qemu window will open
       # and display the VM's console/gui.
       local = True,
   )
   ```
