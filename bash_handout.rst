   
Bash Handout
------------

.. L1

**mkdir dir src-dir dest-dir** ``#make directories``

.. L2

**rm -ir dir/**   ``#remove dir interactively & recursively``
 
.. L3

**cp -ir src-dir/ dest-dir/**  ``#copy recursively``

.. L4

**mv -i src-dir/ dest-dir/**  ``#move/rename``

.. L5

**man man** ``#print manual, press q to exit``

.. L6

**apropos copy** ``#search the term 'copy' in all man pages``

.. L7

**ls -l ~** ``#list files in home directory``

.. L8

**grep 'nobody' /etc/passwd** ``#search line(s) with 'nobody'``

.. L9

**grep -ri 'printf' /usr/include/** ``#search recursive in dir & ignore case``

.. L10

**grep '\\<st..ct\\>' /usr/include/stdio.h** ``#match pattern in all lines``

.. L11

**grep '^st..ct' /usr/include/stdio.h** ``#match pattern in beginning of lines``

.. L12

**find ~/Downloads -iname \\*.pdf -size +4M** ``#find files larger than 4MB``

.. L13

**cat /etc/lsb-release /etc/bash.bashrc** ``#print file content on stdout``

.. L14

**less /etc/bash.bashrc** ``#browse through file, 'q' to quit``

.. L15

**head -n1 /etc/bash.bashrc** ``#print first line and exit``

.. L16

**tail -n1 /etc/bash.bashrc** ``#print last line and exit``

.. L17

**chmod -R o+w dest-dir/** ``#change permission to write for others``

.. L18

**chmod -R a=rx dest-dir/** ``#only read and execute permission for all``

.. L19

**chmod -R 775 dest-dir/** ``#change permission to rwxrwxr-x``

.. L20

**sudo chown -R root.root dest-dir/** ``#change ownership to root(admin)`` 

.. L21

**for i in {1..9}; do echo $i, $RANDOM | cut -c -5 >> 1.csv;done**

``#generated csv file, this one liner will be explained later``

.. L22

**cat 1.csv | sort -r** ``#pipe output of 1st command to 'sort' command``

.. L23

**cat 1.csv | sort -k2 > 2.csv** 

``#sort according to 2nd col and redirect to 2.csv``

.. L24

**cat 2.csv | cut -d ',' -f 1,2 | paste -d ';' 1.csv - > 1_2.csv**

``#cut 1st & 2nd col of 2.csv & paste next to 1.csv cols, '-' is place``
``holder for piped stream from cut, finally redirect to file``

.. L25

**mkdir sed; cd sed;**
**for i in {1..1000}; do shuf -n 10 /var/log/dmesg -o $i.txt;done**

``#create text files with shuffled data, to practice 'sed' command``

.. L26

**sed 's/\\[//g' 1.txt**  ``#replace '[' with empty string``

.. L27

**sed 's/\\[//g' -i.orig {1..1000}.txt** 

``#replace '[' with empty string in place, create backup files with .orig
extension, repeat for all 1000 files``

.. L28

**sed 's/\\ *[0-9]*\\.[0-9]*\\]//g' -i {1..1000}.txt**

``#delete remaining pattern, without backup files``

``eg:'    10.405270]' -->  \ *[0-9]*\.[0-9]*\]``

.. L29

**sed '1i He was here & HERE on top of every page' -i {1..1000}.txt**

``Add text following '1i', '1' is the line number``

.. L30

**sed 's/\\<here\\>/\*\*\*\*/gi' -i {1..1000}.txt**

``Replace 'here' & 'HERE' with '****', 'gi' is global & ignore case``

.. R9

**sed -n '/was/,/ugly UGLY/p' 1.txt >pat.txt** ``#Print lines between pattern``

.. L31

**alias rm='rm -i'** ``#add alias in ~/.bashrc to make it persistent``

.. L32

**export $PATH=PATH:/tmp/bin** 

``#add custom executable path, may append in ~/.bashrc``

.. L33

**export PS1="[\d \t \u@\h:\w ] $ "**

``#add custom bash prompt, may append in ~/.bashrc``

.. L34

**export http_proxy="http://username:password@host:port/"**

``#set proxy in terminal, do for https_proxy & ftp_proxy too, may append
in ~/.bashrc``

.. L35

**export no_proxy=10.0.0.0/8,localhost,*.iitb.ac.in,127.0.0.1**

``#no proxy is for internal sites, may append in ~/.bashrc``

.. L36

**wget -c http://ftp.gnu.org/gnu/wget/wget-1.14.tar.xz**

``# '-c' Continue getting a partially-downloaded file``

.. L37

**wget -nd -P images/ -r -A.png http://matplotlib.org/gallery.html**

``# Download png files to *images* directory recursively``

.. L38

**ifconfig -a** ``#will list all the network interfaces and their status``

.. R10

**nmcli dev wifi connect <name> password <password>** ``#connect to wifi``

.. L39

**df -h**  ``#will list all filesystem disk space usage``

.. L40

**du -sh ~** 

``#estimate file space usage, '-sh' is summarize & human-readable``

.. L41

**wc -lwm /etc/passwd**

``#print number of lines, word, and char of file``

.. L42

**ssh -X root@localhost**

``#get secure shell access of remote machine, '-X' enables X11``

.. L43

**scp -r /etc/udev root@localhost:/tmp**

``#secure copy to remote machine recursively``

.. L44

**tar -cvzf archive.tgz *.txt** ``#create compressed archive``

.. R1

**tar -xvzf archive.tgz** ``#extract to pwd(present working directory)``

.. R2

**zip allfiles.zip *.txt** ``#create a zip file``

.. R3

**unzip allfiles.zip** ``#unzip to pwd``

.. R4

**echo "hi" 1>so1; ls -z 1>so2** ``#redirect STDOUT stream to files``

.. R5

**echo "hi" 2>se1; ls -z 2>se2** ``#redirect STDERR stream to files``

.. R6

**mogrify -resize 50% -format jpg images/*.png** ``#convert all png to jpg``

.. R7

**ln -s images/ ~/Desktop** ``#create shortcut to Desktop``

.. R8

**unlink ~/Desktop/images** ``#remove shortcut``

.. R10

**cat 1.csv | awk {'print $1 + $2'} | paste  -d ',' 1.csv - > sum.csv**

``#sum first two column and create a third one, write to sum.csv``

.. R11

**find /tmp/ -depth -name "* *" -execdir rename 's/ /_/g' "{}" \;**

``#remove all white space from dirs & files recursively``

.. R12

**scp file.pdf root@localhost:;ssh root@localhost 'lp file.pdf'**

``#copy file to remote machine and print``

.. R13

**touch 1.txt** ``#create a file of zero size``

.. R14

**which ls**  ``#return path of *ls* command``

.. R15

**rm -i `find ~/Downloads -iname \*.pdf -size +16M`**

``#execute find to get pdf files >16M and remove them``

.. R16

**whoami** ``#will return present user``

.. R17

**for i in {1..10}; do echo The number is $i; done**

``#Add command in a txt file to make a bash script``

.. R18

**if [ -f /etc/bash.bashrc ]; then echo File exists; fi**

``#check for existence of file``

.. R20

**while :;do echo Infinite loop [hit CTRL+c to stop];done**

``#simple while loop``

.. R21

**w** ``#show logged in users and their activity``

.. R22

**kill -15 `pgrep firefox`** ``#kill firefox``

.. R23

**passwd <user>** ``#update password``

.. R24

**shuf -n 10 /var/log/syslog -o random.txt**``**

``#create file with shuffled lines``

.. R25

**diff -y 1.txt 2.txt** ``#show difference of two files``

.. R26 

**cmp 1.txt 2.txt** ``#compare two files byte by byte``


.. R27

**cat 1.txt| tr a-z A-Z** ``#convert to uppercase``

.. R28

**top** ``#will show system monitor``

.. R29

**last** ``#show listing of last logged in users``

.. R30

**ping -c 5 127.0.0.1** ``#check networking connectivity``

.. R31

**free -m**  ``#show memory(RAM) usage``

.. R32

**pdftk A=in.pdf cat A8-12 output new.pdf**

 ``#extract page 8 to 12 from *in.pdf*``

.. R33

**pdftk 1.pdf 2.pdf cat output 1_plus_2.pdf** ``#add two pdf files``


.. R19

**mutt -a <file-to-be-attached> -s <subject> <email>**

``#wait for content to be typed in an editor``

.. R20

**cat <content-of-email> | mutt -a <file> -s <sub> <email>**

``#non interactive``






























