   
Bash Handout
------------

.. L1

**ls -l ~** ``#list files in home directory``

.. L2

**mkdir dir src-dir dest-dir** ``#make directories``

.. L3

**rm -ir dir/**   ``#remove dir interactively & recursively``
 
.. L4

**cp -ir src-dir/ dest-dir/**  ``#copy recursively``

.. L5

**mv -i src-dir/ dest-dir/**  ``#move/rename``

.. L6

**alias rm='rm -i'** ``#make shortcut``

.. L7

**man man** ``#print manual, press q to exit``

.. L8

**apropos copy** ``#search the term 'copy' in all man pages``

.. L9

**cat /etc/lsb-release /etc/bash.bashrc** ``#print file content on stdout``

.. L10

**less /etc/bash.bashrc** ``#browse through file, 'q' to quit``

.. L11

**head -n1 /etc/bash.bashrc** ``#print first line and exit``

.. L12

**tail -n1 /etc/bash.bashrc** ``#print last line and exit``

.. L13

**find ~/Downloads -iname \\*.pdf -size +4M** ``#find files larger than 4MB``

.. L14

**grep 'nobody' /etc/passwd** ``#search line(s) with 'nobody'``

.. L15

**grep -ri 'printf' /usr/include/** ``#search recursive in dir & ignore case``

.. L16

**grep '\\<st..ct\\>' /usr/include/stdio.h** ``#match pattern in all lines``

.. L17

**grep '^st..ct' /usr/include/stdio.h** ``#match pattern in beginning of lines``

.. L18

**chmod -R o+w dest-dir/** ``#change permission to write for others``

.. L19

**chmod -R a=rx dest-dir/** ``#only read and execute permission for all``

.. L20

**chmod -R 775 dest-dir/** ``#change permission to rwxrwxr-x``

.. L21

**sudo chown -R root.root dest-dir/** ``#change ownership to root(admin)`` 

.. L22

**whoami** ``#will return present user``

.. L23

**ls -l | grep 'rw'** ``#pipe/send the STDOUT of ls -l to grep``

.. L24

**for i in {1..9}; do echo $i,$RANDOM | cut -c -5 >> 1.csv;done**

``#generated csv file, this one liner will be explained later``


.. L25

**sort 1.csv** ``#sort according to first column``

.. L26

**sort -t ',' -r 1.csv** ``#pipe output of 1st command to 'sort' command``

.. L27

**sort -t ',' -k2 1.csv > 2.csv** ``#sort based on 2nd col & redirect to 2.csv``

.. L28

**cat 2.csv | cut -d ',' -f 1,2 | paste -d ';' 1.csv - > 1_2.csv**

``#cut 1,2 col of 2.csv & paste next to 1.csv cols,separate with ;``

.. L29

**cat 1.csv | awk {'print $1 + $2'} | paste  -d ',' 1.csv - > sum.csv**

``#sum first two column and create a third one, write to sum.csv``

.. L30

**wget -c http://ftp.gnu.org/gnu/wget/wget-1.14.tar.xz** ``#download file``

.. L31

**wget -nd -P images/ -r -A.png http://matplotlib.org/gallery.html**

``# Download png files to *images* directory recursively``

.. L32

**ifconfig -a** ``#will list all the network interfaces and their status``

.. L33

**export $PATH=PATH:/tmp/bin** ``#add custom executable path``

.. L34

**export PS1="[\d \t \u@\h:\w ] $ "** ``#add custom bash prompt``

.. L35

**export http_proxy="http://user:passwd@host:port/"** ``#https_proxy,ftp_proxy``

.. L36

**export no_proxy=10.0.0.0/8,localhost,*.iitb.ac.in,127.0.0.1** ``#ignore list``

.. L37

**ssh -X root@localhost** ``#login to remote shell, '-X' enables X11``

.. L38

**scp -r /etc/udev root@localhost:/tmp** ``#copy to remote machine recursively``

.. L39

**df -h**  ``#will list all filesystem disk space usage``

.. L40

**du -sh ~** ``#estimate file space usage``

.. L41

**wc -lwm /etc/passwd** ``#print number of lines, word, and char of file``

.. L42

**diff -y 1.txt 2.txt** ``#show difference of two files``

.. L43 

**cmp 1.txt 2.txt** ``#compare two files byte by byte``

.. L44

**mkdir sed; cd sed;for i in {1..1000}; do shuf -n 10 /var/log/dmesg 
-o $i.txt;done**

``#create text files with shuffled data, to practice 'sed' command``

.. L45

**sed 's/\\[//g' 1.txt**  ``#replace '[' with empty string``

.. L46

**sed 's/\\[//g' -i.orig {1..1000}.txt**

``#replace '[' with empty string in place, repeat for 1000 files``

.. L47

**sed 's/\\ *[0-9]*\\.[0-9]*\\]//g' -i {1..1000}.txt**

``#eg:'    10.405270]' -->  \ *[0-9]*\.[0-9]*\]``

.. L48

**sed '1i He was here & HERE on top of every page' -i {1..1000}.txt**

``Add text following '1i', '1' is the line number``

.. L49

**sed 's/\\<here\\>/\*\*\*\*/gi' -i {1..1000}.txt**

``Replace 'here' & 'HERE' with '****', 'gi' is global & ignore case``

.. L50

**sed -n '/was/,/ugly UGLY/p' 1.txt >pat.txt** ``#Print lines between pattern``

.. L51

**sed = sed/10.txt | sed 'N;s/\n/ /'** ``#Add line number to file``

.. R1

**shuf -n 10 /var/log/syslog -o r.txt**``** ``#create file with shuffled lines``

.. R2

**passwd <user>** ``#update password``

.. R3

**source ~/.bashrc** ``#update the configs in the current bash process``

.. R4

**for i in {1..10}; do echo The number is $i; done** ``#simple for loop``

.. R5

**if [ -f ~/.bashrc ]; then echo File exists; fi** ``#simple if condition``

.. R6

**while :;do echo Infinite loop [hit CTRL+c];done** ``#simple while loop``

.. R7

**mutt -a <file-to-be-attached> -s <subject> <email>** ``#wait for content``

.. R8

**cat <email content> | mutt -a <file> -s <sub> <email>** ``#non interactive``

.. R9

**mogrify -resize 50% -format jpg images/*.png** ``#convert all png to jpg``

.. R10

**echo "hi" 1>so1; ls -z 1>so2** ``#redirect STDOUT stream to files``

.. R11

**echo "hi" 2>se1; ls -z 2>se2** ``#redirect STDERR stream to files``

.. R12

**mount | column -t**  ``#show all mounted drives``

.. R13

**sudo mount /dev/sd<partition> /mnt** ``#mount partition to any directory``

.. R14

**sudo umount /mnt** ``un-mount the partition from directory``

.. R15

**tar -cvzf archive.tgz *.txt** ``#create compressed archive``

.. R16

**tar -xvzf archive.tgz** ``#extract to pwd(present working directory)``

.. R17

**zip allfiles.zip *.txt** ``#create a zip file``

.. R18

**unzip allfiles.zip** ``#unzip to pwd, may overwrite``

.. R19

**unrar -x file.rar** ``#unrar to pwd``

.. R20

**ln -s images/ ~/Desktop** ``#create shortcut to Desktop``

.. R21

**unlink ~/Desktop/images** ``#remove shortcut``

.. R22

**touch 1.txt** ``#create a file of zero size``

.. R23

**which ls**  ``#return path of *ls* command``

.. R24

**find /tmp/ -depth -name "* *" -execdir rename 's/ /_/g' "{}" \;**

``#remove all white space from dirs & files recursively``

.. R25

**kill -15 `pgrep firefox`** ``#kill firefox``

.. R26

**rm -i `find ~/Downloads -iname \*.pdf -size +16M`** ``#rm results of *find*``

.. R27

**top** ``#will show system monitor``

.. R28

**last** ``#show listing of last logged in users``

.. R29

**ping -c 5 127.0.0.1** ``#check networking connectivity``

.. R30

**free -m**  ``#show memory(RAM) usage``

.. R31

**file /bin/ls** ``#show file type``

.. R32

**w** ``#show logged in users and their activity``

.. R33

**jhead -purejpg Photo/*.jpg** ``#removes EXIF data from jpg files``

.. R34

**cat 1.txt| tr a-z A-Z** ``#convert to uppercase``

.. R35

**nmcli dev wifi connect <name> password <password>** ``#connect to wifi``

.. R36

**sudo apt-cache search <package>** ``#search packages(debian,ubuntu,mint)``

.. R37

**sudo apt-get install <package>** ``#install package``

.. R38

**sudo apt-get remove <package>** ``#uninstall package``

.. R39

**sudo dpkg -i <package.deb>** ``#install local deb file``

.. R40

**dpkg -S /bin/ls** ``#search which package the command belongs to``

.. R41

**yum search <package>** ``#search packages(fedora,centOS,redhat)``

.. R42

**sudo yum install <package>** ``#install package / local rpm install``

.. R43

**sudo yum remove <package>** ``#uninstall package``

.. R44

**yum provides /bin/ls** ``#search which package the command belongs to``

.. R45

**pdftk A=in.pdf cat A8-12 output new.pdf** ``#extract page 8 to 12``

.. R46

**pdftk 1.pdf 2.pdf cat output 1_plus_2.pdf** ``#add two pdf files``

.. R47

**lsof | grep bash** ``#list all the files used by bash currenty``

.. R48

**nohup <any-command> &** ``#continue running after logout``

.. R49

**mencoder in.ogv -subpos 85 -sub 1.srt -o out.ogv -oac copy -ovc 
lavc -lavcopts vbitrate=1200 -subfont-text-scale 3** ``#add subtitles``

.. R50

**ffmpeg -f alsa -ac 1 -i pulse -acodec pcm_s16le -f x11grab -r 2 -s
1366x768 -i :0.0 -vcodec libtheora  -b 800k 2.ogv** ``#record A/V``

.. R51

**sox noisyAudio.wav noisefree.wav noisered myprofile 0.26** ``#remove noise``
