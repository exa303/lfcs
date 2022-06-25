# Discover to which package a file belongs to

## Debian and Ubuntu distribution

* First you need to find out the patch to executable. Use `which python`. This will give full path to executable. Use that path to get **package name** with `dpkg -S /usr/bin/python`. 
Then List files installed to your system from package-name. `dpkg -L python3-minimal`

* `dpkg -i <path/package_name>` - install package 
* `dpkg -r <path/package_name>` - uninstall package