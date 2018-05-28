============
Installation
============

For our workshop, we will need a Python 3.4 interpreter. Below are some directions on how to check if you already have the interpreter and how to install it along with some other tools.

Windows
=======

You can download Python for Windows directly from `python.org`_.
After downloading the file  ``*.msi``, open it and follow the instructions.
It is important to remember the path of installation – the directory – as we will need this information during the :ref:`installation of tools <tools>`.

.. note::
    Remember to check "Add Python 3.4 to PATH" when running the installer . This way you will be able to run Python form
    console by just writting ``python``.


Linux (Ubuntu, Fedora, etc.) or Mac
===================================

In order to check our version of Python, enter the following in the command line:

.. code-block:: sh

    $ python --version
    Python 3.4.0

If the ``python`` command is not available or the wrong version appears:

Ubuntu
------

Enter in the command line::

    sudo apt-get install python3.4

Fedora
------

Enter in the command line::

    sudo yum install python3.4

OS X
----

Download and install the package for your system version from `python.org`_ .


Other
-----

Use the system of packages adequate for your distribution. If there is no adequate system
or you cannot find python, you can install it using the sources on the `python.org`_. website.
A compiler and readline library will be required.

Unofficially, we assume that the users of less popular (but not worse!) distributions
will manage the task without any problem :).



.. _tools:

Tools
=====

Windows command line
--------------------

We will do most of our work on the command line. To activate the command line in Windows,
press ``Win+R``. In the open window, type ``cmd`` and click ``OK``.
A new window will appear with white text on a black background:

.. code-block:: bat

    Microsoft Windows [Version 6.1.7601]
    Copyright (c) 2009 Microsoft Corporation. All rights reserved.


    C:\Users\Name>

Text may be different depending on the version of Windows you use.

``C:\Users\Name>``  is a prompt. It informs us of the directory (or folder) in which we currently are and waits for a command.
Later during the workshop ``C:\Users\Name>`` we will refer to it with ``~$``, independently of your
operating system (Windows, Linux, MacOS).

Using the command line, you can move around the contents of the disc (in the same way as in 
``My Computer``).  You can do that by entering commands and pressing ``Enter``.
Use the following commands:

``dir``
    Displays the contents of the current directory. For example, if the ``prompt``
    shows  ``C:\Users\Name``, the ``dir`` command displays the contents of our home directory.

``cd directory``
    Changes the current directory. For example, if you are in ``C:\Users\Name``,
    you can access the directory with your documents by entering ``cd Documents``. If you execute the
    ``dir`` command, you will see something familiar.
    The command  ``cd..`` will move you one level up in the directory tree, that is, 
    to the directory that contains your current directory.

``mkdir directory``
    Creates a new directory.


Virtual environment
-------------------

Now we have to chose the directory for our virtual environment. The virtual environment will allow us to
isolate our work from other parts of the system. For example, you can choose the user home directory.

 For Windows 7 the path to the home directory for the user  ``Ala`` will look like this:
``C:\Users\Ala\`` . You can select a different directory, but it is important to remember where the
file is saved. It must be easily accessible, because we will use it often. 

For example, if our home directory is ``C:\Users\lrekucki``, the command line would look like this:

.. code-block:: bat

    :: Windows
    C:\Users\lrekucki> C:\Python34\python -m venv workshops

.. code-block:: sh

    # Linux or Mac
    ~$ python3.4 -m venv workshops

.. note::
    Ubuntu 14.04 has a bug (https://bugs.launchpad.net/ubuntu/+source/python3.4/+bug/1290847) that causes Python3.4 `venv` module to fail when installing with `pip`.
    To work around this please use this command to create virtual environment::

        ~$ python -m venv --without-pip workshops
        ~$ source workshops/bin/activate
        ~$ wget https://bootstrap.pypa.io/get-pip.py
        ~$ python get-pip.py
        ~$ pip --version

    Check out _`https://pip.pypa.io/en/latest/installing.html` for more information about installing pip.

In your home directory we will create a ``workshops`` directory containing the so called “virtual
environment”.
For now, it is important to activate it:

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


.. _python.org: https://www.python.org/downloads/release/python-343/

.. note::
    You may already have the ``pip`` command available on your system. Always check which pip you are using with command: ``pip --version``.
    You can do this by running one of these commands:

    .. code-block:: sh

        ~$ pip --version
        ~$ pip3 --version
        ~$ pip3.4 --version

    It will give you the version of pip and a path to your virtual environment directory.

    If you can't find your ``pip`` or there is a problem after typing ``which pip`` (``where pip`` on windows), you may need to reinstall pip:

    .. code-block:: sh

        ~$ python -m pip uninstall pip
        ~$ python -m ensurepip


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

Optionally, you can install ``IPython``, which improves the look and comfort when using Python
from the console.

``IPython`` installation:

.. code-block:: sh

    (workshops) ~$ pip install ipython
