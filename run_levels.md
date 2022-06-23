### Boot or Change System into Different Operating Modes

* `systemctl get-default` - The name graphical.target suggests that the operating system is configured to boot into a graphical environment. The file graphical.target contains instructions about what needs to happen to arrive at this target. By reading this, the operating system knows what programs it needs to launch, and in what order, to boot into this target.\

* `sudo systemctl set-default multi-user.target ` - The multi-user.target is something that will make Linux boot normally, with all of its daemons, database server utilities, and whatever we might have configured. But the graphical interface will be skipped. Everything will be text-based. It’s called multi-user because while Linux is booted in this mode multiple users can log in and use the system at the same time. multi-user.target also turns on network services, so the machine will have access to the Internet and local network.

* `sudo systemctl isolate graphical.target` - Now imagine we want to get back to our graphical desktop. Maybe we need to use a 3D modelling application for 1 hour. Instead of changing the default boot target, then rebooting, we can immediately switch to a different target without rebooting. We can switch back to the graphical.target.

* `emergency.target` will load up as few programs as possible. This can be useful for debugging, in case the programs loaded by the other targets are making your system unstable. If you boot into this target, the root filesystem will be mounted as read-only.

* `rescue.target` - a few essential services are loaded, and you are dropped to what is called a root shell. Simply put, a few more programs are loaded than in emergency.target, but fewer than are loaded in multi-user.target. In this root shell, you can type commands as the system administrator, create database backups while the database is not online, fix system settings, and so on.

