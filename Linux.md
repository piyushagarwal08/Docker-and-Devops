# REBOOT YOUR BRAIN 2.0
* Every operating system has an Program called ```Installer``` that does all the setup for OS
* ```Anaconda``` is the Installer for Linux based OS
* Will be using Fedora 32
    - 2 GB RAM
    - 1 Core CPU
    - 25 - 50 GB hdd
* while Installation Destination
    - select custom
    - click + and select /boot ( 500 MB )
    - create / for HDD ( MAX Storage )
    - Keep 5GB free
    - Click Done
* Types of Linux Kernel is Monolithic

## Basic Commands
* ```killall process-name``` ~> will kill all the processes
* Copy Working
    - Copy the file name (Empty file)
    - Copy each character to the file ( character by character )

* Shell ~> Shell is the interface between user and kernel. It is a command line interpreter and is the interface between the user and the kernel
* Types of shell
    - BASH
    - SH
    - TCSH
    - CSH
    - KSH
* Bash reads from ```PATH``` variable in the same order as they are written in it to search for commands 
* History is stored in the ```.bash_history``` file and its path is given in ```$HISTFILE```
* To Hide/UnHide folders graphically we can use shortcut ```Ctrl+H```
* To delete a specific entry from history without leaving any trace ```history -d $((HISTCMD -1)) && history -d N```
* To change the signal ```stty signam-name new-signal```

* A Compiler consists of 3 functions:
    1. Ignorance ~> e.g., Module (printf of C) or Comments
    2. Debug
    3. Execute
* A Comment is always read by compiler but it is made to ignore it 
* ```#!/usr/bin/bash``` is a environment or anything after ```#!``` is something that defines what kind of environment is to be used to interpret the code
* ```GCC``` is made in such manner that it can run files only that have an ```.c``` extension
* To Comment multiple lines in ```Bash``` ,use marker as
```sh
echo "hello world"
<<M
dsd
df
df
d
d
fdfd
M
echo "works"
```
* We can use anything as a marker in place of ```M```
* In Shell Script to access arguments , they can be accessed as
    1. access first argument ```$0```
    2. access second argument ```$1```
    3. access all arguments at once ```$@``` or ```$*```
    4. No of arguments present in command line ```$#```
* In ```if``` statement ```-f``` indicates ```if file exists```
```sh
#!/bin/bash
if [ -f /usr/bin/date ]
then
echo "hello date `date`"
else
echo "date does not exist"
fi
```

* In shell we can run commands as ```cmd1;cmd2```
* ```&&``` and ```&``` both seems to be  true as well but in real scenario what happens in an logical AND operation is performed and multiple commands are not run

* To check input and output of a script use ```bash -x script.extension```

* ```tty``` tells us the file name of terminal and can be used to redirect input/output from one terminal to other

* NetCat is a utility that can be used for Socket, run as ```nc -l 8888```
* To share video streamming ```nc -l 8888 -k | vlc``` on receiver and ```cat videofile | nc ip-of-receiver 8888```

* grep stands for Global Regular Expression Print.
* Research about grep and netcap

* Using Shell Script:
    1. Create a factor command 
    2. type things invisibly && output should not be visible on screen
    3. Make shell script ~> Convert to binary ~> store in /usr/bin
    4. Make a command
        1) out of 10 users ~> find 5 users with unique commands
        2) Take top 20 commands & re run all with 1 sec gap
        3) the command of user 1 should run with user 1 only and so on

* seq ~> This is an command used to generate a sequence of numbers
* to enter passwd from bash use ```echo any-password | passwd username --stdin```
* ```ping -c 3 google.com``` ~> this will ping google 3 times exactly

* ```cut -d: -f1,3 /etc/passwd``` ~> this can be broken down as
    1. -d stands for delimeter and ```:``` is given delimeter
    2. -f stands for field and ```1 and 3``` says the column number

* ```sed "s/string-to-search/string-to-replace" file-path``` ~> Command used for ```find and replace feature once```
* ```sed "s/string-to-search/string-to-replace/g" file-path``` ~> Command used for ```find and replace all```

* To hide input use ```stty -echo``` command

* ```find / -name name-of-file -type f``` ~> used to find file of exact name and ```f``` can be replaced with ```d``` to get directory
* In ```find``` command we use ```-iname``` for ```in-casesensitive``` search


# Xdotool
* It's a command line X11 automation tool
* To Simulate keystrokes, we use command ```key``` as:
    1. ```xdotool key alt+Tab``` ~> change tab
    2. ```xdotool key ctrl+c``` ~> copy text
* To get window id of specific open window, we use ```xdotool search --name word-coming-in-window-name```
* To do any operation over a specific window, by selecting it manually ```xdotool selectwindow any-other-command```
* To limit the search criteria to only visible screens we can use ```xdotool search --onlyvisible --name word-in-window-name```
* To kill/close any window, we use ```windowkill```
* To get mouse location,we use ```xdotool getmouselocation``` ~> it will provide us with ```x-coordinates```,```y-coordinate```,```screen```,```window-id```
* To move window to any specific coordinate, we use command ```windowmove x-xoordinate y-coordinate```
* To get the title of any window, we can use ```xdotool getwindowname window-id```
* To Press Enter, we use ```xdotool key KP_Enter```


# User Management
* Users are of 4 types:
    1. Guest
    2. System User
    3. Non-Privilage (normal users that we usually use)
    4. Root / Admin
* User login methods:
    1. Shell (cmd/ssh/ftp)
    2. GUI ( as such no need of shell )
* To remove a user's password, run command ```passwd -d user-name```
* To add a user, followings things are done by ```useradd``` command:
    1. Access ```/etc/passwd``` file and append entry for user
    2. Access ```/etc/shadow``` file and append entry for user passwd
    3. Access ```/etc/group``` file and append entry for group name
    4. Access ```/etc/gshadow``` file and append entry for group passwd
    5. Create a folder in ```/home/user-name```
    6. Secure home directory as ```700```
    7. Mails are stored at ```/var/spool/mail/user-name```
    8. Copy files from ```/etc/skel``` to home directory of user
    9. Get access to PATh variable
    10. Permission for Kernel interaction


## /etc/passwd
* Syntax of line is:
```user-name:link-etc-shadow:UID(user-id):GID(group-id):Information-about-user:home-directory-path:user-shell```
* range of UID is from 0 ~ 65535 ~> means Power
* UID (0) ~ Root Power
* UID (1000~60000) ~ Non-Root User Power (General Public)
* UID (1~999 && 60001 ~ 65535) ~ System / Dedicated User
* UID of a user can be checked using ```id -u```
* Information about user can checked using ```finger user-name```

## /etc/shadow
* Syntax of line is:
```username:actual-password:no-of-days-since-last-changed:password-expiry-day:maximum-expiry-date```
* To verify hashing algorithm use ```/etc/login.defs```, here we can change the algorithm being used
* To check password policy of any user ```chage -l user-name```
