
Objects and classes
===================

In fact, this chapter could be the subject of a series of workshops, but we will focus on the most
basic things, which we will need while working with Django.

Every value is an object
------------------------

Everything that we have called a value until now can be called “an object” in the world of Python. We saw it in the
example of integers, when :func:`help` printed for us dozens of additional lines of information about
:func:`int`.

Every object has a class
------------------------

The class is the type of an object.
To know what is the class of an object, simply use the function :func:`type`:

    >>> type(2)
    <class 'int'>
    >>> type(2.0)
    <class 'float'>
    >>> type("spam eggs")
    <class 'str'>
    >>> x = 1, 2
    >>> type(x)
    <class 'tuple'>
    >>> type([])
    <class 'list'>

We have talked about classes you can see here earlier: ``int``, ``float``, ``str``, ``tuple``.

When we use numbers in our program, we expect that it will behave like a number - we rely on our
intuition.

However, Python has to know exactly what it means to be a number, e.g., what should happen when we
sum up two numbers and what when we divide them. The class ``int`` provides all this information and
even more.

By using :func:`help` , check what the class ``str`` gives us. Here we give just a few interesting
features:

    >>> help(str.lower)
    Help on method_descriptor:
    <BLANKLINE>
    lower(...)
        S.lower() -> str
    <BLANKLINE>
        Return a copy of the string S converted to lowercase.
    <BLANKLINE>
    >>> help(str.upper)
    Help on method_descriptor:
    <BLANKLINE>
    upper(...)
        S.upper() -> str
    <BLANKLINE>
        Return a copy of S converted to uppercase.
    <BLANKLINE>
    >>> help(str.ljust)
    Help on method_descriptor:
    <BLANKLINE>
    ljust(...)
        S.ljust(width[, fillchar]) -> str
    <BLANKLINE>
        Return S left-justified in a Unicode string of length width. Padding is
        done using the specified fill character (default is a space).
    <BLANKLINE>
    >>> help(str.center)
    Help on method_descriptor:
    <BLANKLINE>
    center(...)
        S.center(width[, fillchar]) -> str
    <BLANKLINE>
        Return S centered in a string of length width. Padding is
        done using the specified fill character (default is a space)
    <BLANKLINE>

All these are operations that each string can do. We can get to them by using dots and calling the
function:

    >>> x = "Ala"
    >>> x.upper()
    'ALA'
    >>> x.lower()
    'ala'
    >>> x.center(9)
    '   Ala   '

And one more important function of a class - it can create a new object of the type it describes. This is called
called "an instance" of a class:

    >>> int()
    0
    >>> str()
    ''
    >>> list()
    []
    >>> tuple()
    ()

So an instance is a new, fresh, value of the type described by the class.

In summary, we've looked at the classes :func:`int`, :func:`str`, :func:`tuple` and
:func:`list`. To find out from which class is the value (object), we use the function
:func:`type`. To create an instance of a class (a new object), we call the class like call
a function, by using parentheses ``()``. For instance:
``int()``.

Define classes
--------------

Classes like ``int`` or ``str`` are already known to Python, but we can create our own classes to
customize their behavior. This is called defining a class.

You can define your class as easy as you can define a function. In fact, a class is
basically nothing but a group of functions. Lets define a class named ``Dog``:

.. testsetup:: simple-class

    class Dog(object):

        def bark(self):
            print("Woof! Woof!")

::

    class Dog(object):

        def bark(self):
            print("Woof! Woof!")

Classes begin with the word :keyword:`class`, after which we give the name of the new class.
The ``(object)`` indicates that our new type ``Dog`` is a specific sub-type of ``object``.
That is, instances of our class, i.e. values created from it, will be of the type ``Dog`` but
also of the more general type ``object``.

Actually this is what we said that every value is an object.
Indeed, each class is a specialization of ``object`` in Python. Hence, every value always has ``object``
as most general type.

However, it is worth to know that every function in the class must have at least one argument. Its
value is an object from which we have called this function (that is to say the object placed before
the dot). This first argument should be called ``self`` by convention. In our example we have one function
called ``bark`` (as you can see it accepts exacly one argument), lets test haw it works:

.. testcode:: simple-class

    my_new_pet = Dog()
    my_new_pet.bark()

.. testoutput:: simple-class

    Woof! Woof!

This argument can be named as you wish, but the
`most widespread convention <https://www.python.org/dev/peps/pep-0008/#function-and-method-arguments>`_
is to call it ``self``.


Attributes of objects
---------------------

Besides methods (functions defined inside class) the objects can also have attributes:

.. testcode:: simple-class

    my_new_pet = Dog()
    my_new_pet.name = "Snoopy"

    print(my_new_pet.name)

.. testoutput:: simple-class

    Snoopy

Sometimes we want for every object of the class to have an attribute, such as every dog should have a
name. We can add this requirement by adding a function with a special name ``__init__``::

    class Dog(object):

        def __init__(self, name):
            self.name = name

        def bark(self):
            print("Woof! Woof!")

In function ``__init__`` we have assigned a value to new attribute ``name`` on ``self``. As mentioned
eariler ``self`` is a actual object of class ``Dog``. Now we can use this attribute in other methods:

.. testcode:: init-class

    class Dog(object):

        def __init__(self, name):
            self.name = name

        def bark(self):
            return "Woof! %s! Woof!" % (self.name,)

    snoopy = Dog("Snoopy")
    pluto = Dog("Pluto")
    print(snoopy.bark())
    print(pluto.bark())

.. testoutput:: init-class

    Woof! Snoopy! Woof!
    Woof! Pluto! Woof!

This :func:`__init__` function is called during the creation of an object.
We call this special function a constructor, because it helps to build the object.
In this example it accepts two arguments: ``self`` and ``name``, but when we create
an instance of class ``Dog`` we need to provide only ``name`` arguemnt. ``self`` is
always filled automatically by Python.

Inheritance
===========

In previous chapter we created a ``Dog`` class that was subtype of ``object``, but this is
not the only possible case. We can for example say that that ``Dog`` is also an ``Animal``::

    class Animal(object):
        pass

    class Dog(Animal):

        def __init__(self, name):
            self.name = name

        def bark(self):
            return "Woof! %s! Woof!" % (self.name,)

Here we have created new class, ``Animal``, that inherits from ``object``. ``Dog`` class now
inherits from ``Animal``. In other terms:

* every Animal is an object
* every Dog is an Animal and every Dog is an object

This way we can put some general behaviour in ``Animal`` class, like walking, and leave dog
specific behaviour in ``Dog`` class::

    class Animal(object):

        def run(self, distance):
            return "Run %s meters." % (distance,)

Method ``run`` will be available in all subtypes of ``Animal`` (including ``Dog``)::

    scooby = Dog("Scooby")
    print(scooby.run(10))

