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

#. For web2py install *pymysql* in virtualenv ::

	pip install pymysql

#. Now change appropriate fields in *settings.py* to make your django work with mysql


Useful mysql commands for debugging
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. To login into prompt ::

	mysql -u root -p

#. To view all databases in mysql prompt ::

	show databases;

#. To create new user and grant permission to database ::

	GRANT ALL ON <database>.* TO <user>@localhost IDENTIFIED BY '<password>';

#. To create a new database ::

	CREATE DATABASE <database-name>;

#. To load/use certain database from list ::

	use <database>;

#. To view list of tables in selected database ::

	show tables;

#. To view particular table contents ::

	select * from <table-name>;

#. To view description of a table ::

	desc <table-name>;

#. To delete a table ::

	drop table <table-name>

#. To list all users in mysql ::

	select User from mysql.user

.. note::
	You need to drop table if you have changed the name in the models.py file.

A simple example (Adding two numbers using a form)
--------------------------------------------------

