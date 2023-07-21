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

Detailed configuration
----------------------

* Server type: Developer Machine

* Database usage: Multifunctional Database

* Drive for the InnoDB datafile: Default

* Number of concurrent connections: Decision Support (DSS)/OLAP

* Networking options.
	- TCP/IP Networking: Yes
	- Port Number: 3306


* Server SQL Mode.
	- Enable Strict Mode: No

* Default character set: Standard Character Set

* Windows options.
	- Install As Windows Service: Yes
	- Service Name: MySQL
	- Launch the MySQL Server automatically: Yes.
	- Include Bin Directory in Windows PATH: Yes.

* Security options.
	- Modify security settings: Yes.
	- New root password: root
	- Enable root acces from remote machines: No.
	- Create An Anonymous Account: No.

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

Install the mysql 8.0.34 (mysql-installer-community-8.0.34.0.msi) installer from https://dev.mysql.com/downloads/windows/installer/8.0.html 
Install vc_redist.x64.exe from https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170 
Modify the name to  vcredist_x64.exe
