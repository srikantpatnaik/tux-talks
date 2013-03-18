==================
Regular Expression
==================

.. contents::

.. section-numbering::

.. raw:: pdf

   PageBreak oneColumn

.. footer::
   
   Page: ###Page###/###Total###,
   Personal training 

|
|

What is a regular expression ?
------------------------------

In computing, a regular expression is a specific pattern that provides concise
and flexible means to "match" (specify and recognize) strings of text, such as
particular characters, words, or patterns of characters. Common abbreviations 
for "regular expression" include regex and regexp. [#]_

.. [#] `Wikipedia definition <http://en.wikipedia.org/wiki/Regular_expression>`_


Why Regular expression ?
------------------------

In a world, where almost every computer has data in text files, a regex can help
find out patterns easily. 


grep and regular expression
---------------------------

GNU **g/re/p (global / regular expression / print)** is a commnad 
line tool to search plain data sets for line matching a regular expressions. 

In basic regular expressions the metacharacters "?", "+", "{", "|", "(", and ")"
lose their special meaning; instead use the backslashed versions "\?
", "\+", "\{", "\|", "\(", and "\)"

.. note::
	To get a consistent results across terminals, first 

	export LC_COLLATE=C


Line and word anchors
^^^^^^^^^^^^^^^^^^^^^

This will find lines ending with sh ::

	grep sh$ /etc/passwd 

Output will be

.. image:: data/sh$.png
	:width: 100%	
			
To check that PATH is exported in ~/.bashrc, first select "export" lines and
then search for lines starting with the string "PATH", so as not to
display "MANPATH" and other possible paths ::

	grep export ~/.bashrc | grep '\<PATH'

Similarly, '\\>' matches the end of a word.

.. '\\' is used to escape '\', otherwise its '\>'


Character classes
^^^^^^^^^^^^^^^^^

A bracket expression is a list of characters enclosed by "[" and "]". 
It matches any single character in that list; if the first character of the
list is the caret, "^", then it matches any character NOT in the list ::

	grep [^s] /etc/passwd


The next command will print all the lines containing 'y' or 'f' ::

	grep [yf] /etc/group


Wildcards
^^^^^^^^^

Use the "." for a single character match. For example, if you want to get a list of all
five-character English dictionary words starting with "c" and ending in "h"
(handy for solving crosswords) ::

	grep '\<c...h\>' /usr/share/dict/american-english


Pattern matching using Bash features
------------------------------------

Character ranges
^^^^^^^^^^^^^^^^

Now try listing all files in home directory, starting with "a", "b", "c", "x", "z" ::

	ls [a-cxz]*

Also try, **ls *[a-cxz]**

Character classes
^^^^^^^^^^^^^^^^^

Character classes can be specified within the square braces, using the syntax
[:CLASS:], where CLASS is defined in the POSIX standard and has one of
the values

**"alnum", "alpha", "ascii", "blank", "cntrl", "digit", "graph", "lower", "print", \  
"punct", "space", "upper", "word" or "xdigit"**

example::

	ls [[:digit:]]*

If you want only files/dirs with digits ::

	ls [[:digit::]


GNU sed stream editor
---------------------

A Stream EDitor is used to perform basic transformations on text read from a 
file or a pipe. The result is sent to standard output. The syntax for
the sed command has no output file specification, but results can be saved to 
a file using output redirection. The editor does not modify the original input.

===   =====================================
a\\   Append text after a line.
c\\   Replace text (usually a text block).
i\\   Insert text before a line.
d     Delete lines.
s     Make substitutions.
y     Translate characters (like Unix tr).
===   =====================================


Suggested readings and credits
------------------------------

#. http://en.wikipedia.org/wiki/Regular_expression

























