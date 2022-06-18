# configure user resource limits and restrictions in Linux

* On the command line, we changed from where we were into `/etc/security` and we then listed all the content in that directory as shown above. The particular file that we are interested in is `limits.conf` So the next thing to do is to use a text editor like vim or even nano so go into the configuration file `limits.conf` and make any changes that we want.

The configuration file on its own holds a lot of valuable information that can guide us through. The format it follows is `<domain> <type> <item> <value>`.

A domain can be a user or group let us assume that we have a group called @techdirectarchive and a user called @raphael (it is always a good practice to put a @in front of a domain element). The type can either be a hard or a soft limit, item can be the size of the core, the size of nproc. The value is usually the restriction that you want to set. If for example, you want a particular group called coders to have only 30 processes running, the value will be 30.

`Hard` limit means that the limit will be enforced.
A `soft` limit is the type of limit that is not enforced immediately and sends a warning to the user before continuing the next line of action.
