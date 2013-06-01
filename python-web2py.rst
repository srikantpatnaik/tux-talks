=============
Python Web2Py
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

What is Python web2py?
----------------------



Why web2py ?
------------


Setting up web2py
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


#. For web2py install *pymysql* in virtualenv ::

	pip install pymysql


Useful mysql commands for debugging
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. To login into prompt ::

	mysql -u root -p

#. To view all databases in mysql prompt ::

	show databases;

#. To create a new table ::

	

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

#. To delete one row from table ::

	delete from  complaint where id=1;

#. To delete all rows from table::

	delete from complaint;
		
#. To list all users in mysql ::

	select User from mysql.user


APIs and shortcuts of web2py
----------------------------

#. To use `bpython`, go to the directory where you unzipped `web2py` and run `bpython`

#. To use `ipython`, go to the directory where you unzipped `web2py` and run `ipython --ipython-dir=.`

#. Use the below entry in `db.py` file to disable auto creation of user group ::

	auth.settings.create_user_groups = None

#. Creating a group from either web2py-shell or through `appadmin` interface ::

	auth.add_group('role', 'description')

#. Adding all members to default group, add this entry in `db.py` ::

	auth.settings.everybody_group_id = <group-id>

#. Add user to particular group ::

	auth.add_membership(group_id, user_id)

#. Make authentication mandate by simply using decorators at the top of any function
   in `controllers.py` ::

	@auth.requires_login()
    def index():
		return 'hello'

#. In `controllers`, to check if logged user belongs to particular group(role), if so then redirect ::

    if auth.has_membership(role='techie'):
        redirect(URL('techie'))  

#. In `models`, to make a SQL form for logged in user ::

	db.define_table('complaint',
                 Field('Tell_about_your_issue', 'text', requires=IS_NOT_EMPTY()),
                 Field('Start_time', 'datetime', requires=IS_NOT_EMPTY()),
                 Field('End_time', 'datetime', requires=IS_NOT_EMPTY()),
                 Field('user_id', writable=False, readable=False, default=auth.user_id),
                 Field('status', writable=False, readable=False, default=''),
                 )


#. If you have modified table, i.e modified any `Field` in the table, then one must remove
   the old table entry from `databases` directory. For eg::

	rm applications/remote_debugger/databases/02e12c0d07c63481668595e1a72588c2_complaint.table

   Now reload the page you will have new form up and ready. 


#. To run IPython in the environment just issue ::

	python web2py.py -S myapplication -M

#. To print all the comments of particular user use this in `views` ::

	<h2>Your complaints</h2>
	{{for row in rows.find(lambda row: row.user_id==str(auth.user_id)):}}
	{{=row.About_your_issue}}
	{{pass}}

   Here rows are rows of table, `row.user_id` is the column name. Essentially we are checking
   the value of `row.user_id` with value of table `auth.user_id`. If both matches then print 
   the comment(which means print the comments of logged in user only)

   For the same above case, in controller create an object `rows` ::

	rows = db(db.complaint).select()


#. In `views`, this will create link `row.user_id` to URL [application]/access/args ::
	
	{{=A(row.user_id, _href=URL('access', args=[row.user_id]))}}	

A simple example (Adding two numbers using a form)
--------------------------------------------------

