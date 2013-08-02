   
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

**find ~/Downloads -iname *.pdf -size +4M** ``#find files larger than 4MB``

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





































