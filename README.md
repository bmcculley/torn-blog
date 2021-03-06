Running the Tornado Blog example app
====================================
This demo is a simple blogging engine that uses MySQL to store posts. 
Since it depends on MySQL, you need to set up MySQL and the database 
schema for the demo to run.

![tornblog screenshot](http://i.imgur.com/idWIpFN.png)

1. Install prerequisites and build tornado

   See http://www.tornadoweb.org/ for installation instructions. If you can
   run the "helloworld" example application, your environment is set up
   correctly.

2. Install MySQL if needed

   Consult the documentation for your platform. Under Ubuntu Linux you
   can run "apt-get install mysql". Under OS X you can download the
   MySQL PKG file from http://dev.mysql.com/downloads/mysql/

3. Install Python prerequisites

   Install the packages MySQL-python, torndb, and markdown (e.g. using pip or
   easy_install). Note that these packages currently only work on
   Python 2. Tornado supports Python 3, but this blog demo does not.

3. Connect to MySQL and create a database and user for the blog.

   Connect to MySQL as a user that can create databases and users:
   mysql -u root

   Create a database named "blog":
   mysql> CREATE DATABASE blog;

   Allow the "blog" user to connect with the password "blog":
   mysql> GRANT ALL PRIVILEGES ON blog.* TO 'blog'@'localhost' IDENTIFIED BY 'blog';

4. Create the tables in your new database.

   You can use the provided tornblog.sql file by running this command:
   mysql --user=blog --password=blog --database=tornblog < tornblog.sql

   You can run the above command again later if you want to delete the
   contents of the blog and start over after testing.

5. Run the blog example

   With the default user, password, and database you can just run:
   ./app.py

   If you've changed anything, you can alter the default MySQL settings
   with arguments on the command line, e.g.:
   ./app.py --mysql_user=casey --mysql_password=happiness --mysql_database=foodblog

6. Visit your new blog

   Open http://localhost:8888/ in your web browser. You will be redirected to
   a create user page because the blog at least one admin account to be setup.

   Currently the first user to connect will automatically be given the
   ability to create and edit posts.

   Once you've created one blog post, subsequent users will not be
   prompted to sign in.
