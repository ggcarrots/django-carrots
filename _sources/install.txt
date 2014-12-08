============
Installation
============

During our workshops we will need an interpreter of Python language, version 3.4. Below there are some tips how to check if we already have the interpreter or how to install it together with tools.

Windows
=======

You can download versions for Windows directly from `python.org`_.
After downloading the file  ``*.msi`` open it and follow the instructions.
It is important to remember the path of installation – the directory – we will need the information during the :ref:`installation of tools <tools>`.


Linux (Ubuntu, Fedora, etc.) or Mac
===================================

In order to check our version of Python, enter in the command line the following:

.. code-block:: sh

    $ python --version
    Python 3.4.0

If the python command is not available or the wrong version appears:

Ubuntu
------

In the command line enter::

    sudo apt-get install python3.4

Fedora
------

In the command line enter::

    sudo yum install python3.4

OS X
----

Download and install the package for your system version from `python.org`_ .


Other
-----

Use the system of packages adequate for your distribution. If there is no adequate system
or you can not find python, you can install it using the sources on `python.org`_. website.
A compiler and readline library will be required.

Unofficially we assume that the users of less popular (but not worse!) distributions
for sure will manage the task without any problem :).



.. _tools:

Tools
=====

Windows command line
--------------------

Most of the work we will perform using the command line. To activate the command line in Windows
click on ``Start``, and then ``Run...``. In the open window type ``cmd`` and click ``OK``.
A new window will appear with a white text on a black background:

On Windows 7 there is no "Run..." option and on Windows 8 there is no "Start" ;)

Instead one can search for "Command Prompt" or "cmd" (through Start Menu on W7 or W8 omni-search), or use "Win Key"+R shortcut.


.. code-block:: bat

    Microsoft Windows [Version 6.1.7601]
    Copyright (c) 2009 Microsoft Corporation. All rights reserved.


    C:\Users\Name>

Text may be different depending on the version of Windows you use.

``C:\Users\Name>``  is a prompt. It informs us of the directory in which we are
at the moment and waits for a command.
Later during the workshop ``C:\Users\Name>`` we will cut to the  ``~$``, independently of your
operating system (Windows, Linux, MacOS).

Using the command line you can move around the content of the disc (in a similar way as by entering
``My Computer``).  The following commands are to be used:

``dir``
    Displays the contents of the current directory. For example, if the ``prompt``
    shows  ``C:\Users\Name``, the ``dir`` command displays the contents of our home directory.

``cd directory``
    Changes the current directory. For example, if you’re in the ``C:\Users\Name``,
    by entering ``cd Documents`` you access the directory with your documents. If you execute the
    ``dir`` command you will see something familiar.
    The command  ``cd..`` will move you to the directory on an upper level.

``mkdir directory``
    Creates a new directory.


Virtual environment
-------------------

Now we have to chose the directory for our virtual environment. The virtual environment will allow to
isolate our work from other system’s parts. For example you can choose the user home directory.

 For Windows 7 the path to the home directory for the user  ``Ala`` will look like this:
``C:\Users\Ala\`` . You can select a different directory but it is important to remember where the
file is saved. It must be easily accessible, because we will use it often. 

For example, if our home directory is ``C:\Users\lrekucki``, the command line would look like this:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> C:\Python34\python -m venv workshops

.. code-block:: sh

    # Linux or Mac
    ~$ python3.4 -m venv workshops


In your home directory there will be created a directory ``workshops`` containing so called “virtual
environment”.
For now, it is important for us that after it is activated:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> workshops\Scripts\activate

.. code-block:: sh

    # Linux or Mac
    ~$ source workshops/bin/activate

The ``python`` command will run the correct version of Python, so we will not have to enter the full
path at the beginning nor the version at the end.


Ensure your terminal is well configured:

.. code-block:: bat

    :: Windows
    (workshops) C:\Users\lrekucki>where python
    C:\Users\lrekucki\workshops\Scripts\python.exe
    ...

    (workshops) C:\Users\lrekucki>where pip
    C:\Users\lrekucki\workshops\Scripts\pip.exe
    ...

    (workshops) C:\Users\lrekucki>python --version
    3.4.0

.. code-block:: sh

    # Linux or Mac
    (workshops) ~$ which python
    /home/lrekucki/workshops/bin/python
    (workshops) ~$ which pip
    /home/lrekucki/workshops/bin/pip
    ...

    (workshops) ~$ python --version
    3.4.0


.. _python.org: http://python.org/download/releases/3.4.0/

If there is any problem after typing ``which pip`` (``where pip`` on windows) there could be a need to reinstall pip:

.. code-block:: sh

    python -m pip uninstall pip
    python -m ensurepip

Summary
-------

New virtual environment installation:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> C:\Python34\python -m venv workshops

.. code-block:: sh

    # Linux or Mac
    ~$ python3.4 -m venv workshops

Virtual environment activation:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> workshops\Scripts\activate

.. code-block:: sh

    # Linux or Mac
    ~$ source workshops/bin/activate

Just make sure that you use the proper Python version:

.. code-block:: sh

    (workshops) ~$ python --version
    3.4.0


IPython
-------

Eventually you can install ``IPython``, which improves the look and comfort when using Python
from the console.

``IPython`` installation:

.. code-block:: sh

    (workshops) ~$ pip install ipython

    
.. note::

   If ``pip`` command doesn't work, then please use ``pip3``.
