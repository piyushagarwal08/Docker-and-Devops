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
