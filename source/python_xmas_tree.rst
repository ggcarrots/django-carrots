==================
  Christmas Tree
==================

Christmas are coming, Christmas presents time and, at least for Christmas trees :) in every shopping centre. As an exercise, we will try to draw a tree in the
console.

We are going to start from the most basic version of this exercise so that we can later extend it to a more functional version. As an incentive, let’s make a half of the Christmas tree: 

.. testcode::

    print("*")
    print("**")
    print("***")
    print("*")
    print("**")
    print("***")
    print("****")
    print("*")
    print("**")
    print("***")
    print("****")
    print("*****")
    print("******")

.. testoutput::

    *
    **
    ***
    *
    **
    ***
    ****
    *
    **
    ***
    ****
    *****
    ******

It doesn’t look bad, but we have had to do a lot of typing. What if we would like to have a smaller 
tree? Or a bigger one, composed of hundreds of elements to be printed on a page size A0? Definitely 
too much typing, even if we would do it by multiplying strings  (``"*" * 100``, itd.). Obviously it is 
such a repetitive activity that the program can do it for us.



Lists and The ``for`` loop
==========================

Loops will serve us to deal with such repetitive actions. Staying in the Christmas atmosphere, imagine for a moment that we are the Santa Claus and we have to deliver to everyone Christmas gifts. 

As you know, Santa has a list of people who deserve gifts. The simplest approach to guarantee that no 
one is omitted, will be to check sequentially the list and deliver their gifts to one after another. 
Aside from the physical aspects of the task [#speed]_, the procedure of delivering the gifts could 
look like this::

    Let the People List contain people who should receive gifts.

    For each person (known as the Person), which is on the list of people:
        Provide a gift to Person

Formatting of text above is not accidental. This is actually a disguised program in Python::

    gift_list = people_who_deserve_gifts()

    for person in gift_list:
        deliver_gift(person)
        print("Gift delivered to:", person)
    print("All gifts delivered")

Most of the things should look familiar to you. We are calling here two functions: 
:func:`people_who_deserve_gifts` i :func:`deliver_gift` - their functioning is known only by Santa 
Claus. Result of the first one can be named `gift_list`, so that we could refer to this value later (
the same as described above).

A new element is a loop itself, which consists of: 

* the word :keyword:`for`,
* names we want to give to the next elements,
* the word :keyword:`in`,
* the value of a list or the name that refers to it.
* the content indented of one level (the same way as in the case of :keyword:`if`).

Still we haven’t said anything about lists, as they do not differ much from the intuitional concept of 
lists in the everyday life. We can easily think of lists in Python as we think of any other list (a 
shopping list, a guest list, exam results etc.) written on a paper and numbered.

Let's start with a blank page (activate interactive mode):

    >>> L = []
    >>> L
    []

At any time we can check how many items we have saved on our list by using the function :func:`len`.

    >>> len(L)
    0

Let's make another list (which can have the same name or a different one):

    >>> L = ["Ala", "Ola", "Jacek"]
    >>> len(L)
    3

As in the case of tuples, consecutive elements of the list are separated by commas. Unlike tuples, 
brackets ``[`` i ``]`` are obligatory.

To preview a particular position of an element on the list (remember that we count the positions from 0 ):

    >>> L[0]
    'Ala'
    >>> L[1]
    'Ola'
    >>> L[2]
    'Jacek'
    >>> L[3]
    Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
    IndexError: list index out of range

We can also use the loop :keyword:`for`,to execute instructions for every element of the list:

    >>> for name in L:
    ...     print("Imie:", name)
    ...
    Imie: Ala
    Imie: Ola
    Imie: Jacek

In the same way, we can print the first part of our half of the Christmas tree:

    >>> lst = [1, 2, 3]
    >>> for n in lst:
    ...     print("*"*n)
    ...
    *
    **
    ***

Well, unfortunately we still have to type the entire contents of the list. This problem can be solved 
by the function :func:`range` (czyli zakres, przedział). If the description provided by ``help(range)``
seems too complicated for you, here you have a few examples:


    >>> list(range(2, 5, 1))
    [2, 3, 4]
    >>> list(range(1, 11, 2))
    [1, 3, 5, 7, 9]
    >>> list(range(1, 11))
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    >>> list(range(1, 2))
    [1]
    >>> list(range(2))
    [0, 1]

The function :func:`range` does not directly create the list, but it returns a generator. Generators 
allow you to create sequences of values, without taking unnecessary memory. In order to obtain a  list 
of the sequence, we use the function
:func:`list`.

The :func:`range` has three forms. The most basic and most used one creates a sequence from 0 to the 
given number. The other forms allow you to specify the start of the range and a step. The created 
sequence never includes the end of the specified range.


Then let’s print a larger Christmas tree:

    >>> lst = list(range(1, 11))
    >>> lst
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    >>> for i in lst:
    ...     print("*"*i)
    *
    **
    ***
    ****
    *****
    ******
    *******
    ********
    *********
    **********

:func:`range` has saved a lot of our time. We can save even more if we omit naming the list:

    >>> for i in list(range(1, 5)):
    ...     print(i*"#")
    #
    ##
    ###
    ####

When you use the keyword :keyword:`for`, we do not have to use the
:func:`list`. `for` can cope with the function of `range`, so we can simplify our program even more:


    >>> for i in range(1, 5):
    ...     print(i*"#")
    #
    ##
    ###
    ####



Nothing stands in the way of placing one loop inside another loop. Just remember to use appropriate 
indentations and use different names e.g. ``i`` and ``j`` (or more associated with the list content):

    >>> for i in range(1, 3):
    ...    for j in range(2, 4):
    ...        print(i, j)
    1 2
    1 3
    2 2
    2 3

Using this technique, we can repeat our piece of the Christmas tree:

    >>> for i in range(3): # powtórz 3 razy
    ...    for size in range(1, 4):
    ...        print(size*"*")
    *
    **
    ***
    *
    **
    ***
    *
    **
    ***

Before proceeding to the next chapter, create ``xmas.py`` file with this program and try to modify it 
so that each of the three repetitions of the first (external) loop, the second one was executed one 
more time. This way, we should get our half of the Christmas tree described at the beginning of the 
chapter.


Defining a function
===================

We have already seen how functions solve many of our problems. However, they not solve them all – or 
at least not exactly the way we would like functions to solve them.
Sometimes we must solve a problem on our own. If it occurs often in our program, it would be nice to 
have a function that solves it for us.

Python gives us the opportunity:

    >>> def print_triangle(n):
    ...     for size in range(1, n+1):
    ...         print(size*"*")
    ...
    >>> print_triangle(3)
    *
    **
    ***
    >>> print_triangle(5)
    *
    **
    ***
    ****
    *****

Let's have a closer look at the function :func:`print_triangle`::

    def print_triangle(n):
        for size in range(1, n+1):
            print(size*"*")

The definition of a function always starts with the word :keyword:`def`. Next, we give the name to our 
function. In brackets we indicate what names should be given to its arguments when the function is 
called. In the following lines we provide instructions to be executed when we use the function.


As shown in the example, the instructions in the function may include names that we have given as the 
names of the arguments.The principle of operation is as follows - if you have created a function with 
three arguments:

    >>> def foo(a, b, c):
    ...     print("FOO", a, b, c)

When calling the function (the same way as with any function we have called before), you need to 
specify values for each one of the arguments:

    >>> foo(1, "Ala", 2 + 3 + 4)
    FOO 1 Ala 9
    >>> x = 42
    >>> foo(x, x + 1, x + 2)
    FOO 42 43 44

Note that the name is just a label. If we change a label for another one, the other labels will not 
change – the same happens with the arguments:

    >>> def plus_five(n):
    ...     n = n + 5
    ...     print(n)
    >>> x = 43
    >>> plus_five(x)
    48
    >>> x
    43


Returning values
----------------

The functions which we have previously used had one important property that is missing in the 
functions created by ourselves - they returned the value instead of printing it immediately. To 
achieve the same effect, you should use the instruction :keyword:`return`. This is a special 
instruction that can be found only in the functions.


We can now improve our BMI calculator by adding a function to compute BMI::

    def calc_bmi(height, weight):
        return weight / height ** 2

Finally, in a smooth way we will solve the problem from the end of the previous chapter:


.. testcode::

    # xmas.py

    def print_triangle(n):
        for size in range(1, n+1):
            print(size * "*")

    for i in range(2, 5):
        print_triangle(i)


.. testoutput::

    *
    **
    *
    **
    ***
    *
    **
    ***
    ****


Objects and classes
===================

In fact, this chapter could be the subject of a series of workshops, but we will focus on the most 
basic things, which we will need while working with Django.

Values are objects
------------------

Everything that we have called a value up to the moment we can call also “an object”. We saw it in the 
example of integers, when :func:`help` printed for us dozens of additional lines of information about :
func:`int`.

Every object has a class
------------------------

If you want to know what is a class of an object, just use the function :func:`type`:

    >>> type(2)
    <class 'int'>
    >>> type(2.0)
    <class 'float'>
    >>> type("Gżegżółka")
    <class 'str'>
    >>> x = 1, 2
    >>> type(x)
    <class 'tuple'>
    >>> type([])
    <class 'list'>

When we use numbers in our program, we expect that it will behave like a number - we rely on our 
intuition.

However, Python has to know exactly what it means to be an integer, e.g., what should happen when we 
sum up two numbers and what when we divide them. The class provides all this information and even more.

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

And one more important function of each class - it can create an object with its attributes (so 
called, “instance”):

    >>> int()
    0
    >>> str()
    ''
    >>> list()
    []
    >>> tuple()
    ()

In summary, we've looked at the class :func:`int`, :func:`str`, :func:`tuple`,
:func:`list`. To find out which class is the value (object), we use the function
:func:`type`. To create an instance of a class (a new object), we call the class, like we have called 
the function, adding parentheses ``()``, e.g.
``int()``.

Define classes
--------------

Just as you can create your own functions, you can create your own classes. In fact, a class is 
nothing but a group of functions:

.. testsetup:: simple-class

    class Dog(object):

        def bark(self):
            print("Woof! Woof!")

::

    class Dog(object):

        def bark(self):
            print("Woof! Woof!")

Classes begin with the word :keyword:`class`, after which we give the name of the new class. What (
object) is will be explained later, when we will be creating more complex classes.

However, it is worth to know that every function in the class must have at least one argument. Its 
value is an object from which we have called this function (that is to say the object placed before 
the dot):

.. testcode:: simple-class

    burek = Dog()
    burek.bark()

.. testoutput:: simple-class

    Woof! Woof!

This argument can be named as you wish, but it is intuitive to call it ``self``.


Attributes of objects
---------------------

Besides methods (functions) the objects can also have attributes:

.. testcode:: simple-class

    burek = Dog()
    burek.name = "Snoopy"

    print(burek.name)

.. testoutput:: simple-class

    Snoopy

Sometimes we want for every object of the class to have an attribute, such as every dog should have a 
name. We can add this requirement by defining a function with a special name ``__init__``:

.. testcode:: init-class

    class Dog(object):

        def __init__(self, name):
            self.name = name

        def bark(self):
            return "Woof! %s! Woof!" % (self.name,)

    burek = Dog("Snoopy")
    pluto = Dog("Pluto")
    print(burek.bark())
    print(pluto.bark())

.. testoutput:: init-class

    Woof! Snoopy! Woof!
    Woof! Pluto! Woof!


The Entire Christmas tree
=========================

The previous chapter was fairly theoretical, so now we'll try to use at least a part of this knowledge 
by completing our program to display a Christmas tree.

For the record::

    # xmas.py

    def print_triangle(n):
        for size in range(1, n+1):
            print(size * "*")

    for i in range(2, 5):
        print_triangle(i)

How can we improve the function :func:`print_triangle`, o display the entire segment of the Christmas 
tree, not just half of it?


First of all, let’s determine how we want our result to look like for the exact value of argument  ``n``. It seems to make sense that, ``n`` would be the width. Then for ``n = 5``, we would expect::

      *
     ***
    *****

It is worth noting that each line consists of two asterix more than the previous one. So we can use 
the third argument :func:`range`:

.. testcode::

    def print_segment(n):
        for size in range(1, n+1, 2):
            print(size * "*")

    print_segment(5)

.. testoutput::

    *
    ***
    *****

It is not exactly what we have wanted, as it should be aligned in the centre. The method/function :func
:`unicode.center` mentioned in the previous section, helps us:


.. testcode::

    def print_segment(n):
        for size in range(1, n+1, 2):
            print((size * "*").center(n))

    print_segment(5)

.. testoutput::
    :options: +NORMALIZE_WHITESPACE

      *
     ***
    *****

However, a new problem appears:

.. testcode::

    def print_segment(n):
        for size in range(1, n+1, 2):
            print((size * "*").center(n))

    for i in range(3, 8, 2):
        print_segment(i)

.. testoutput::
    :options: +NORMALIZE_WHITESPACE

     *
    ***
      *
     ***
    *****
       *
      ***
     *****
    *******

If we know in advance, what size the widest segment is, we can add an additional argument to  :func:`
print_segment`,  to align to the width. Combining all of the knowledge we have acquired up to the 
moment:


.. testsetup:: tree-final

    input.queue.append("7")

.. testcode:: tree-final

    def print_segment(n, total_width):
        for size in range(1, n+1, 2):
            print((size * "*").center(total_width))

    def print_tree(size):
        for i in range(3, size+1, 2):
            print_segment(i, size)

    print("Choose size of the Christmas tree:")
    n = int(input())
    print_tree(n)

.. testoutput:: tree-final
    :options: +NORMALIZE_WHITESPACE

    Choose size of the Christmas tree:
    7
       *
      ***
       *
      ***
     *****
       *
      ***
     *****
    *******


Task for volunteers
-------------------

Create a class ``XMASTree`` which for a given size and upon calling the method ``draw`` will print the 
following pictures (sizes 1, 2 and 3):

::

          *
         /|\
        /_|_\
          |

::

           *
          /|\
         /_|_\
          /|\
         / | \
        /__|__\
           |

::

            *
           /|\
          /_|_\
           /|\
          / | \
         /__|__\
           /|\
          / | \
         /  |  \
        /___|___\
            |



.. rubric:: Notes

.. [#speed] Assuming you have 24 hours to deliver one gift for everyone in the world,
    for one gift you have about 10 microseconds.

