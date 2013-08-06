#!/bin/bash

echo "converting into 2 colon rst file"

python two_column.py -i bash_handout.rst > /dev/null

if [ $? -eq 1 ]
   then
   echo "error in conversion into 2 colon, check line width!"	
   exit 0
fi

echo -e "\nLatest/Issues: http://git.io/kOVtRw\n" >> script2col.rst

sleep 0.5 

rst2pdf -s mystyle.txt script2col.rst

mv script2col.pdf bash_handout.pdf

clear

echo "done conversion to pdf"

evince bash_handout.pdf&
