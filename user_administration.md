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
* `usermod -aG docker <user_name>` - add user to group docker 
* `sudo gpasswd -d username groupname` - delete from groupname

## Group administration

* `groupadd developers` - creates group
* `groupmod -n <new> <old>`- change name from old to new
* `groupdel developers` - delete group
