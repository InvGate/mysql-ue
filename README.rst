MySQL Simplified Installer
==========================

MySQL Simplified Installer is an `NSIS <http://nsis.sourceforge.net>`_ based
installation script to set up a MySQL Server on Windows without significant user
interaction (just a double click on the executable).

If you need a database
available on Windows and for licensing reasons you can't bundle it inside your
product, downloading this package and double clicking on it will be a simple
enough task for even the dumbest of sysadmins. It just uses sane defaults
for all the options in the MySQL MSI.

Default configuration
---------------------

* Database type: mixed
* Port: ``3306``
* Root password: ``root``

The default configuration is only meant to allow a second software package
to easily log into the database server and change access control rules in a
way that's convenient for your application.

Typically, your application would use the above information to access the
MySQL Server and run something like:

::

  CREATE DATABASE yourdb;
  GRANT ALL ON yourdb.* TO your_user@'%' IDENTIFIED BY 'SOME_PASSWORD';
  USE mysql;
  UPDATE user set password=PASSWORD('SOME_OTHER_PASSWORD') where User='root';
  FLUSH PRIVILEGES;

Make sure you generate good enough passwords at install time and replace them,
having hardcoded passwords in your installers is a crappy security practice.


Usage
-----

In order to build this script, you must have NSIS installed. Under Debian/Ubuntu:

::

$ apt-get install nsis

Afterwards, just build the NSIS script:

::

$ make

A binary called ``MySQL-UE.exe`` will be created and can be installed on
any Windows Server by just double clicking on it.
