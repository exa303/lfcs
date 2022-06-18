# Manage system-wide environment profiles

### Manage system-wide environment profiles

* `export VARIABLE="value"` - set env variable.
* `printenv VARIABLE` - get env variable value.
* `export EDITOR="vim"` - set default editor to vim.

### Set Persistent Environment Variables on Linux

* Using the .bashrc file
The most popular way to set environment variables persistently is to add them to the “.bashrc” file.
The “.bashrc” file is a script executed whenever you initialize an interactive shell session.
	* `export VARIABLE="value"` add this line in `.bashrc` file located in home directory.

* `cat /etc/enviroument` - check enviroument file.

### Unset Environment Variables

* `unset <variable>` - unsets variable

## Common Set of Environment Variables on Linux
*	`USER` : the current username of the user using the system;
* `EDITOR` : the program run to perform file edits on your host;
* `HOME` : the home directory of the current user;
* `PATH` : a colon separated list of directories where the system looks for commands;
* `PS1` : the primary prompt string (to define the display of the shell prompt);
* `PWD` : the current working directory;
* `_` : the most recent command executed on the system (by the user)
* `MAIL` : the path to the current user’s mailbox;
* `SHELL` : the shell used in order to interpret commands on the system, it can be many different ones (like bash, sh, zsh or others);
* `LANG` : the language encoding used on the system;
* `DESKTOP_SESSION` : the current desktop used on your host (GNOME, KDE)
* `HISTFILESIZE` : number of lines of command history stored in the history file;
* `HISTSIZE` : number of lines of history allowed in memory;
* `UID` : the current UID for the user

