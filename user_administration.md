# User administration

## Importaint directories
* `/etc/passwd` - contains information about accounts.
* `/etc/shawod` - contains hashes.
* `/etc/groups` - contains groups.
* `/etc/sudoers/` - contains sudo acessess.

---

## Commands 

* `groups <username>` - shows what groups does a user belong to.
* `compgen -u` - generate user list.
* `compgen -g` - generate group list.
* `id -u` - returns user id.

## User CRUD

* `useradd -m -d /home/user -u <user id> -g <group id> -s /bin/bash <username>` - create user
* `useradd -s /bin/bash <username>` - create user short
* `userdel -r <username>` - delete user
* `usermod -L <user>` - Lock
* `usermod -U <user>` - Unlock
* `usermod -aG docker <user_name>` - add user to group docker. You can also add user to multiple groups. Jus type using `,`.
* `sudo gpasswd -d username groupname` - delete from groupname

* `sudo passwd <username>` -  change password of a username

Renaming users in unix is easy becouse uuid is separate from username.
* `usermod -l <new username> <old username>` - rename username
* `usermod -d /home/<dirname> -m <newUsername>` - ususaly after user rename you will want to rename the home directory


## Group administration

* `groupadd developers` - creates group
* `groupmod -n <new> <old>`- change name from old to new
* `groupdel developers` - delete group

## Account expiration

* `sudo usermod <username> -e 2022-05-05` - sets user expiration date. 
* `chage -l <username>` - lists information about user.



