### the /proc Filesystem

The actual internal structure of /proc/sys depends heavily on the kernel being used, but you are likely to find the following directories inside. In turn, each of them will contain other subdirectories where the values for each parameter category are maintained:

    dev: parameters for specific devices connected to the machine.
    fs: filesystem configuration (quotas and inodes, for example).
    kernel: kernel-specific configuration.
    net: network configuration.
    vm: use of the kernel’s virtual memory.
