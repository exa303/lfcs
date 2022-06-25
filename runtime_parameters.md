# Change kernel runtime parameters, persistent and non-persistent

### the /proc Filesystem

The actual internal structure of /proc/sys depends heavily on the kernel being used, but you are likely to find the following directories inside. In turn, each of them will contain other subdirectories where the values for each parameter category are maintained:

    dev: parameters for specific devices connected to the machine.
    fs: filesystem configuration (quotas and inodes, for example).
    kernel: kernel-specific configuration.
    net: network configuration.
    vm: use of the kernel’s virtual memory.

   * `sysctl -a ` - complete list of Kernel parameters.

### Change or Modify Linux Kernel Runtime Parameteres

To set the value for a kernel parameter we can also use sysctl, but using the -w option and followed by the parameter’s name, the equal sign, and the desired value.

Another method consists of using echo to overwrite the file associated with the parameter. In other words, the following methods are equivalent to disable the packet forwarding functionality in our system (which, by the way, should be the default value when a box is not supposed to pass traffic between networks):

* `echo 0 > /proc/sys/net/ipv4/ip_forward`
* `sysctl -w net.ipv4.ip_forward=0`

It is important to note that kernel parameters that are set using sysctl will only be enforced during the current session and will disappear when the system is rebooted.

To set these values permanently, edit `/etc/sysctl.conf` with the desired values. For example, to disable packet forwarding in `/etc/sysctl.conf` make sure this line appears in the file:

`net.ipv4.ip_forward=0`

Then run following command to apply the changes to the running configuration.

* `sysctl -p`

Other examples of important kernel runtime parameters are:

* `fs.file-max` specifies the maximum number of file handles the kernel can allocate for the system. Depending on the intended use of your system (web / database / file server, to name a few examples), you may want to change this value to meet the system’s needs.

Otherwise, you will receive a `“Too many open files”` error message at best, and may prevent the operating system to boot at the worst.