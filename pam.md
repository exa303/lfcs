### Pluggable Authentication Modules

Pluggable Authentication Modules (PAM) have been around since 1997. I was taught that PAM originated from Sun's Solaris, and it does appear that the first enterprise use and popularization occurred there. However, according to a 1997 article I found, the first full implementation was the Linux-PAM deployment. The article is still available from Linux Journal. The basic premise and implementation have not changed since then. There are some new keywords and many new modules, but overall the process is the same as 20 years ago.
More Linux resources


As the A in PAM indicates, PAM is about authentication. In most cases, when you log in to a system via a console or from across the network with SSH or Cockpit, PAM is involved. It doesn't matter if the user accounts are held locally or in a centralized location. For as much as it is used, it not common to manipulate the PAM configuration files directly. Other utilities do it for you. Many changes are made at installation, such as when installing the sssd RPM or using the ipa-client-install utility. The most common additional configurations can be handled by authconfig (RHEL7 and older) or authselect (RHEL8), or even through the Cockpit web interface. Most administrators do not learn about PAM configuration files until they get involved in advanced authentication and security topics.
What do we gain with PAM?

PAM separates the standard and specialized tasks of authentication from applications. Programs such as login, gdm, sshd, ftpd, and many more all want to know that a user is who they say they are, yet there are many ways to do that. A user can provide a user name and password credential which can be stored locally or remotely with LDAP or Kerberos. A user can also provide a fingerprint or a certificate as a credential. It would be painful to ask each application developer to rewrite the authentication checks for each new method. A call to PAM libraries leaves the checks to authentication experts. PAM is pluggable in that we can have different applications run different tests and modular in that we can add new methods with new libraries.
Image
PAM

Let's look at the high-level steps taken when a locally-defined user logs into a text-based console:

    The login application prompts for a user name and password, then makes a libpam authentication call to ask, "Is this user who they say they are?" The pam_unix module is responsible for checking the local account authentication. Other modules may also be checked, and ultimately the result is passed back to the login process.
    The login process next asks, "Is this user allowed to connect?", then makes an account call to libpam. The pam_unix module checks for things like whether the password has expired. Other modules might check host or time-based access control lists. An overall response is handed back to the process.
    If the password has expired, the application responds. Some applications simply fail to log in the user. The login process prompts the user for a new password.
    To get the password verified and written to the correct location, the login process makes a password call to libpam. The pam_unix module writes to the local shadow file. Other modules may also be called to verify the password strength.
    If the login process is continuing at this point, it is ready to create the session. A session call to libpam results in the pam_unix module writing a login timestamp to the wtmp file. Other modules enable X11 authentication or SELinux user contexts.
    On logout, when the session is closed, another session call can be made to libpam. This is when the pam_unix module writes the logout timestamp to the wtmp file.

There are many components to PAM

If you make a change to authentication using a program such as authconfig or authselect and want to see what changed, here are some of the places to look:

`/usr/lib64/security`
A collection of PAM libraries that perform various checks. Most of these modules have man pages to explain the use case and options available.

`/etc/pam.d`
A collection of configuration files for applications that call libpam. These files define which modules are checked, with what options, in which order, and how to handle the result. These files may be added to the system when an application is installed and are frequently edited by other utilities.

Since there are several checks done by all applications, these files may also have include statements to call other configuration files in this directory. Most shared modules are found in the system-auth file for local authentication and the password-auth file for applications listening for remote connections.

`/etc/security`
A collection of additional configuration files for specific modules. Some modules, such as pam_access and pam_time, allow additional granularity for checks. When an application configuration file calls these modules, the checks are completed using the additional information from its corresponding supplemental configuration files. Other modules, like pam_pwquality, make it easier for other utilities to modify the configuration by placing all the options in a separate file instead of on the module line in the application configuration file.

`/var/log/secure`
Most security and authentication errors are reported to this log file. Permissions are configured on this file to restrict access.

`man pam`
This man page describes the overall process, including the types of calls and a list of files involved.

`man pam.conf`
This man page describes the overall format and defines keywords and fields for the pam.d configuration files.

`man -k pam_`
This search of man pages lists pages available for modules installed.