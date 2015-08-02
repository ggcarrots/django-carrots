Multiple Files
==============

Up to this point we have written all of our programs in one file. This is perfectly
fine as long as the file is not much longer than 100 lines. As the file gets bigger
is getting more and more difficult to find something in it. That's why it is a good
practice to keep the program files smaller, but obviously not all (or even most)
the programs can fit into one file that small. Python solves this problem using
:keyword:`import` keyword.

Imports
-------

Lets get back for a second to our xmas tree example::

    def print_segment(n, total_width):
        for size in range(1, n+1, 2):
            print((size * "*").center(total_width))

    def print_tree(size):
        for i in range(3, size+1, 2):
            print_segment(i, size)

    print("Choose size of the Christmas tree:")
    n = int(input())
    print_tree(n)

This program is not yet to big, but lets try to split it into smaller files. First
create new file ``tree_utils.py`` and move the first two functions to that file, so
it looks like this::

    def print_segment(n, total_width):
        for size in range(1, n+1, 2):
            print((size * "*").center(total_width))

    def print_tree(size):
        for i in range(3, size+1, 2):
            print_segment(i, size)

Now lets create another file ``tree_main.py`` (in the same directory, this is
important) with the following contents::

    import tree_utils

    print("Choose size of the Christmas tree:")
    n = int(input())
    tree_utils.print_tree(n)

Here we can see how :keyword:``import`` keyword is used. It allows us to use
functions and objects from other files. After the keyword we provide the name of
file without ``.py`` extension, this is called the module name. When using imported
function we need to provide module name and function name separated by dot, just
like we did with objects. In this example ``tree_utils`` is a module name. Thanks
to this we have access to all the functions and objects from ``tree_utils`` module.

Import from
-----------

:keyword:``import`` keyword has also another form: ``from module import function``.
When we rewrite ``tree_main.py`` example to use this form it will look like this::

    from tree_utils import print_tree

    print("Choose size of the Christmas tree:")
    n = int(input())
    print_tree(n)

This way we can call ``print_tree`` function as in the original program (as if it
was defined in the same file). Now it is easier to call this function, but we have
access to only this function.

We can also access both ``tree_utils`` function by writing::

    from tree_utils import print_tree, print_segment

This way we can import as many functions or objects from a module as we want. To
make the code shorter we can also write::

    from tree_utils import *

This will import all functions and objects from ``tree_utils`` module, but this
solutions discouraged, as it is difficult to see what was actually imported.

Batteries included
------------------

Python has a `batteries included` philosophy. This means that Python comes with many
modules that can be used by developers. This way we can concentrate on writing our
programs instead of solving all the basic problems that have been already solved.

For the list of modules available with Python check python `documentation`_. As you
can see there are a lot of them. They allow as to deal with system services, math,
date and time and many more.

.. _documentation: https://docs.python.org/3/library/index.html

Lottery
-------

One of the interesting modules included with Python is ``random`` module. It allows
us to generate random number (real or integer), select random element from a list
and many other. Documentation for this module can be found `here`_. When you
read it, you will notice it says `pseudo-random number generators`. That's just
because these are not really random numbers, they only look like this, but this is
good enough for our purpose.

So now we can create a lottery. For we have to import ``random`` module and use
:func:`randrange` function::

    import random

    value = random.randrange(1, 11)
    print(value)

Save it to a file ``lottery.py``.

:keyword:`import` keyword allows us to use not only files created by us, but also
included with Python. That is why we can write ``import random`` even though there
is no ``random.py`` file in the same directory.

.. note::

    You need to be careful here and not name the file ``random.py``. If you do
    Python will have problem with importing ``random`` module, as it will try
    to import our file instead of the one included with Python.

Lets finnish our lottery example by adding user input::

    import random

    value = random.randrange(0, 10)
    user_value = int(input("Please choose a number from 1 to 10: "))

    if value == user_value:
        print("Congratulations, you have won.")
    else:
        print("Sorry, today's winning number is %s." % (value,))

Packages
--------

So we have learned how to organize our code into multiple files. As our program gets
bigger we can split it into multiple modules. As time goes by we will have more and
more files. In order to deal with this we can put files (modules) in a directory.

Lets consider following file structure::

    trees/
        __init__.py
        oak.py
        beech.py
        maple.py
        xmas.py
    sequence/
        __init__.py
        arithmetic.py
        geometric.py
        fibonacci.py

So we have two directories: ``trees`` and ``sequence`` that contain some modules
(.py files). These directories are called `packages`. In order for a directory to
be a package, it has to contain ``__init__.py`` file (it can be empty). This way
Python can distinguish packages from other directories.

If we want to import something from a package we can use the same ``import`` keyword
as before::

    import trees.xmas

    tree.xmas.print_tree(4)

As you can see, we have to use ``.`` to indicate that we want to import ``xmas``
module from ``trees`` package. In order to use functions from this module we need to
write whole package and module name before function name: ``tree.xmas.print_tree``.
This is because ``tree`` package and ``xmas`` module are also objects just like any
other object in python and we can use them in the same way.

Packages can be nested in each other, but remember, there have to be ``__init__.py``
file on each level. Using packages and modules we can create most complex
applications.

Exercises
---------

Zadanie 1: Losowość w grze
``````````````````````````

Opis:

Wykorzystując kod z zadania *Gra 'papier, nożyczki, kamień'* zmodyfikuj kod by komputer losował swój wybór wykorzystując
moduł `random`.

**Podpowiedź:**

Wykorzystamy w tym zadaniu tzw. `krotki` (ang. tuple), które służą do przechowywania sekwencji danych np.:

.. code-block:: sh

    python
    my_numbers = (1, 20, 3, 10)
    my_friends = ('John', 'Alice', 'Kate', 'Lucas')
    my_pets = ('skipper', 'Mr. Parrot', 'kitty', 'blacky')

W krotce będziemy przechowywać 'papier', 'nożyce', 'kamień'.

Explore:

* Spraw by wybór komputera był trochę `głupszy` i zamiast wybierać z pośród 3 możliwości z równym prawdopodobieństwem
  wybierał jedną opcję z z prawdopodobieństwem 50% a pozostałe dwie z 25%.
* Spraw by wybór komputera był `głupszy` jak w poprzednim punkcie, ale tym razem element, który będzie losowany z 50%
  prawdopodobieństwem również był losowy, np:

  * W pierwszym uruchomieniu komputer może wybrać: kamień 50%, papier 25%, nożyczki 25%.
  * W kolejnym uruchomieniu komputer może wybrać: kamień 25%, papier 50%, nożyczki 25%.

**Uwaga:** powyższe przykłady nie mają ustalonej kolejności, wybory komputera powinny być losowe!
Podpowiedź: należy wylosować indeks elementu, który będzie miał pradopodobieństwo 50%.

Zadanie 2. Dodanie menu do gry
``````````````````````````````

Opis:

Aktualnie nasza gra przyjmuje wszystkie wartości jakie wpisze użytkownik i działa na nich jakby były zawsze poprawne.
Pora to zmienić i przyjmować tylko określone wartości od użytkownika a na niepoprawną wartość wypisywać błąd.

Explore:

 * Zamiast przyjmować wartości bezpośrednio wyświetl `menu` z możliwościami wyboru, np:

::

    A. Kamień
    B. Papier
    C. Nożyczki
    D. Help
    Q. Wyjście


 * Dodaj przed rozpoczęciem prawdziwej gry wybór poziomu trudności komputera, np:

::

    A. Sprytny komputer
    B. Mniej sprytny komputer

który będzie określał czy komputer ma być losowy (33%/33%/33%) czy `głupi` (50%/25%/25%).

Zadanie 3. Lotto
````````````````

Write program ``lotto.py`` that asks user to give 6 numbers from 1-49, then selects
6 numbers from 1-49 by random and tell user if he won or not.


.. _here: https://docs.python.org/3/library/random.html
