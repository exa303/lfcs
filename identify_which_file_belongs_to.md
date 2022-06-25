# Discover to which package a file belongs to

## Debian and Ubuntu distribution

* First you need to find out the patch to executable. Use `which python`. This will give full path to executable. Use that path to get **package name** with `dpkg -S /usr/bin/python`. 
Then your can youse package name to look at package dependencies `dpkg -L python3-minimal`