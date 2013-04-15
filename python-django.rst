=============
Python Django
=============

.. contents::

.. section-numbering::

.. raw:: pdf

   PageBreak oneColumn

.. footer::
   
   Page: ###Page###/###Total###,
   Personal training 

|
|

What is Python Django?
----------------------



Why Django ?
------------


Setting up django
-----------------


Installing using virtualenv
~~~~~~~~~~~~~~~~~~~~~~~~~~~


Setting apache2
~~~~~~~~~~~~~~~

Setting mysql
~~~~~~~~~~~~~

#. Install following packages from apt-get in ubuntu ::

	apt-get install mysql-server python-mysqldb python-dev python2.7-dev\
	 libmysqlclient-dev

#. Create mysql *root* password at the time of installation (a prompt will popup)

#. Now install *MySQL-python* in virtualenv ::

	pip install MySQL-python

#. Now change appropriate fields in *settings.py* to make your django work with mysql


Useful mysql commands for debugging
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. To login into prompt ::

	mysql -u root -p

#. To view all databases in mysql prompt ::

	show databases;

#. To load/use certain database from list ::

	use <database>;

#. To view list of tables in selected database ::

	show tables;

#. To view particular table contents ::

	select * <table-name>;

#. To view description of a table ::

	desc <table-name>;


A simple example (Adding two numbers using a form)
--------------------------------------------------

