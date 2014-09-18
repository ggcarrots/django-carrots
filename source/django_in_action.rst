======================
Introduction to Django
======================


What is Django?
===============

So far we have been learning about Python. Python is just a language (and a set of basic libraries) 
that allows you to create programs. Creating an interactive website in Python requires a huge amount 
of work, that is why we will use Django. Django gives us a set of tools, features (as the functions we 
learned earlier, but more complex ones), and classes which facilitate creation of websites.

On order to obtain a fully interactive website we need a few items:

* application server - here we use Django
* HTML and CSS files responsible for the appearance of the website
* Databases to store survey questions and answers.

We will start by creating an application server.

Creation of the new project
===========================

Installation
------------

Install Django by running it on the console ``pip install django==1.6.4``:

.. code-block:: sh

   (workshops) ~$ pip install django==1.6.4
   Downloading/unpacking django==1.6.4
     Downloading Django-1.6.4-py2.py3-none-any.whl (6.7MB): 6.7MB downloaded
   Installing collected packages: django
   Successfully installed django
   Cleaning up...

A suitable package will be downloaded from `PyPI <http://pypi.python.org>`_ - a package repository 
where you can find many useful libraries.


Beginning of project
--------------------

Django provides the administrative script ``django-admin.py``. It allows you to create the scheme of our 
site.

To create a new project with the site, we launch ``django-admin.py startproject carrots``:

.. code-block:: sh

   # Linux

   (workshops) ~$ django-admin.py startproject carrots
   (workshops) ~$ tree carrots
   carrots/
   ├── carrots
   │   ├── __init__.py
   │   ├── settings.py
   │   ├── urls.py
   │   └── wsgi.py
   └── manage.py

   1 directory, 5 files


.. code-block:: bat

   :: Windows

   (workshops) C:\Users\TeddyBear> python -m django-admin startproject carrots
   (workshops) C:\Users\TeddyBear> tree /f carrots
   Folder PATH listing
   Volume serial number is 00FA-07FF
   C:\USERS\TEDDYBEAR\DOCUMENTS\CARROTS
   │   manage.py
   │
   └───carrots
           settings.py
           urls.py
           wsgi.py
           __init__.py


Structure of project
--------------------

The newly created project contains a "carrots" directory and some basic files.

The file ``carrots/settings.py`` includes the settings such as the language, a database, installed 
applications. We can edit the file by ourselves. Inside you will find the default settings and 
explanatory comments.


``manage.py`` file allows us to administer the web site, create or clear the database, run a simple 
application server, etc. Later we will see how to use it.


File ``carrots/urls.py`` contains information about the paths in the site.

Other files are less interesting. Usually we do not look inside them at all nor we modify them. The 
more curious ones can find more information by Google.

Settings of application
-----------------------

In the ``carrots/settings.py`` file find ``TIME_ZONE`` and set time zone as Warsaw. You should get the following:
::

   TIME_ZONE = 'Europe/Warsaw'

   LANGUAGE_CODE = 'pl'


To make it simpler we also exclude the advanced support for time zones in the database - it will not be needed in our project. In the ``settings.py`` file please find  ``USE_TZ``  and set them as False:
::

   USE_TZ = False

..
.. ``INSTALLED_APPS`` zawiera informację o zainstalowanych aplikacjach. Projekty ``Django``
.. składają się z wielu aplikacji, w tym wypadku są to na przykład aplikacje: ``auth`` do
.. uwierzytelniania użytkowników, ``sessions`` do zarządzania sesją użytkownika itd.

..
.. Jak widać, ``INSTALLED_APPS`` jest po prostu krotką zawierającą napisy. Odkomentowanie
.. dwóch ostatnich napisów włączy aplikację do administracji. Później będziemy jej używać.

Database
--------

Now it's time to use the previously described file ``manage.py`` to create the database. For this purpose we execute the option ``syncdb``. In the project directory run ``python manage.py syncdb``:

.. code-block:: sh

   (workshops) ~$ cd carrots
   (workshops) ~/carrots$ python manage.py syncdb

    Creating tables ...
    Creating table auth_permission
    Creating table auth_group_permissions
    Creating table auth_group
    Creating table auth_user_groups
    Creating table auth_user_user_permissions
    Creating table auth_user
    Creating table django_content_type
    Creating table django_session
    Creating table django_site
    Creating table django_admin_log

    You just installed Django's auth system, which means you don't have any superusers defined.
    Would you like to create one now? (yes/no): yes
    Username (leave blank to use 'fasola'): beans
    Email address: admin@example.com
    Password:
    Password (again):
    Superuser created successfully.
    Installing custom SQL ...
    Installing indexes ...
    Installed 0 object(s) from 0 fixture(s)

If all goes well Django asks you to provide data of the administrator account. The user name you may 
leave as it is proposed, you can give any e-mail address.  Memorize the provided data (i.e, username 
and password) so that you can log in the control panel. In the above example, the user will be ``beans``.

 If you want to learn more about ``manage.py``, run python ``manage.py help``:

.. code-block:: sh

    (workshops) ~/carrots$ python manage.py help

 You will get a list of all commands and options supported by ``manage.py``. 

To get help on a single command, run  ``manage.py help`` command:

.. code-block:: sh

    (workshops) ~/carrots$ python manage.py help syncdb

Administration interface
------------------------

Now we can run our aplication. Run server by typing ``python manage.py runserver``:

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py runserver
   Validating models...

   0 errors found
   April 19, 2013 - 20:14:37
   Django version 1.6.4, using settings 'carrots.settings'
   Development server is running at http://127.0.0.1:8000/
   Quit the server with CTRL-BREAK.

Our website will be available on the  http://127.0.0.1:8000/  or http://localhost:8000/ adress. 

Administration panel is available on ``admin/`` path, that’s why we will go to 
http://localhost:8000/admin/.


We create a new application for questionnaires
----------------------------------------------

For now, we have created a project ``carrots``. Projects in Django are divided into apps that provide 
specific functions.

We want to publish questionnaires on our website, that’s why we will add the application ``polls``.

From the command line type ``python manage.py startapp polls``:

::

   (workshops) ~/carrots$ python manage.py startapp polls
   (workshops) ~/carrots$ tree .
   .
   ├── carrots
   │   ├── __init__.py
   │   ├── settings.py
   │   ├── urls.py
   │   ├── wsgi.py
   ├── db.sqlite3
   ├── manage.py
   └── polls
       ├── __init__.py
       ├── admin.py
       ├── models.py
       ├── tests.py
       └── views.py

   2 directories, 14 files

After creating the application it must be activated in our project. In the file ``carrots/settings.py``
we have to add the application ``polls`` to ``INSTALLED_APPS``. The result should look like as 
follows::

    INSTALLED_APPS = (
        'django.contrib.admin',
        'django.contrib.auth',
        'django.contrib.contenttypes',
        'django.contrib.sessions',
        'django.contrib.messages',
        'django.contrib.staticfiles',
        'polls'
    )

Applications in ``Django`` consists of several files:

* ``admin.py`` - definitions for the administration panel,
* ``models.py`` - definitions of the models for the database,
* ``tests.py`` - testing applications,
* ``views.py`` - views of the application.

Summary
-------

Django installation:

.. code-block:: sh

   (workshops) ~$ pip install django==1.6.4

Project directory creation

.. code-block:: sh

   # Linux

   (workshops) ~$ django-admin.py startproject carrots


.. code-block:: bat

   :: Windows

   (workshops) C:\Users\TeddyBear> python -m django-admin startproject carrots

Setup of time zone in ``carrots/settings.py`` file::

   TIME_ZONE = 'Europe/Warsaw'

   LANGUAGE_CODE = 'pl'

   USE_TZ = False

Creation of database (you need to run that command after adding every new model):

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py syncdb

Server's start-up:

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py runserver

Creation of the new application named ``polls``:

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py startapp polls

Just remember that after creating an application you should add it to ``INSTALLED_APPS``.
