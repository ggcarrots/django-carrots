==================
  Christmas Tree
==================

Christmas are coming, Christmas presents time and, at least for Christmas trees :) in every shopping center. As an exercise, we will try to draw a tree in the
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
too much typing, even if we would do it by multiplying strings  (``"*" * 100``, and so on.). Obviously it is
such a repetitive activity that the program can do it for us.



Lists and the ``for`` loop
==========================

Loops will serve us to deal with such repetitive actions. Staying in the Christmas atmosphere,
imagine for a moment that we are the Santa Claus and we have to deliver Christmas gifts to everyone.

As you know, Santa has a list of people who deserve gifts. The simplest approach to guarantee that no
one is omitted, will be to check sequentially the list and deliver their gifts to one after another.
Aside from the physical aspects of the task [#speed]_, the procedure of delivering the gifts could
look like this::

    Let the People List contain people who should receive gifts.

    For each person (known as the Person), which is on the list of people:
        Provide a gift to the Person

Formatting of text above is not accidental. This is actually a disguised program in Python::

    gift_list = people_who_deserve_gifts()

    for person in gift_list:
        deliver_gift(person)
        print("Gift delivered to:", person)
    print("All gifts delivered")

Most of the things should look familiar to you. We are calling here two functions:
:func:`people_who_deserve_gifts` and :func:`deliver_gift` - their inner workings are only known by Santa
Claus. The result of the first one can be named `gift_list`, so that we could refer to this value later (
the same as described above).

A new element is a loop itself, which consists of:

* the word :keyword:`for`,
* names we want to give to the next elements,
* the word :keyword:`in`,
* the value of a list or the name that refers to it.
* the content indented of one level (the same way as in the case of :keyword:`if`).

Still we haven’t said anything about lists, as they do not differ much from the intuitive concept of
lists in the everyday life. We can easily think of lists in Python as we think of any other list (a
shopping list, a guest list, exam results etc.) written on a paper and numbered.

Let's start with a blank page by starting a new python interpreter:

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
brackets ``[`` and ``]`` are obligatory.

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
    ...     print("Name:", name)
    ...
    Name: Ala
    Name: Ola
    Name: Jacek

In the same way, we can print the first part of our half of the Christmas tree:

    >>> lst = [1, 2, 3]
    >>> for n in lst:
    ...     print("*"*n)
    ...
    *
    **
    ***

Well, unfortunately we still have to type the entire contents of the list. This problem can be solved
by the function :func:`range`. Check ``help(range)``
for the full story, or check these quick examples:


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

The :func:`range` function does not directly create a list, but it returns a generator. Generators
generate the elements of a sequence one at a time, thereby avoiding to store the full sequence in memory.
In order to obtain a list of the sequence, we use the function :func:`list`. If we skip :func:`list` call,
the result will look like this:


    >>> range(1, 4)
    range(1, 4)


The :func:`range` function has three forms. The most basic and most used one creates a sequence from 0 to the
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
:func:`list`. :keyword:`for` can handle the generator given by `range`. Hence, we can simplify our program even more:


    >>> for i in range(1, 5):
    ...     print(i*"#")
    #
    ##
    ###
    ####



Nothing prevents us to put one loop inside another loop, so let's do it! Just remember to use appropriate
indentations and use different names e.g. ``i`` and ``j`` (or more associated with the list content):

    >>> for i in range(1, 3):
    ...    for j in range(11, 14):
    ...        print(i, j)
    1 11
    1 12
    1 13
    2 11
    2 12
    2 13

Here we have inner loop that iterates from 11 to 13 (remember, 14 is not included when using ``range``) and
outer loop that iterates from 1 to 2. As you can see, items from inner loop are printed twice, for each iteration
of outer loop.

Using this technique, we can repeat our piece of the Christmas tree:

    >>> for i in range(3): # repeats 3 times
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

We have already seen how functions solve many of our problems. However, they do not solve all our problems
– or at least not exactly the way we would like functions to solve them.
Sometimes we must solve a problem on our own. If it occurs often in our program, it would be nice to
have a function that solves it for us.

We can do it like this in Python:

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
function. Between the parenthesizes, we indicate what names should be given to its arguments when the function is
called. In the following lines we provide instructions to be executed when we use the function.


As shown in the example, the instructions in the function may include names that we have given as the
names of the arguments. The principle of operation is as follows - if you create a function with
three arguments:

    >>> def foo(a, b, c):
    ...     print("FOO", a, b, c)

When you call this new function, you need to
specify a value for each argument. This just like all the functions we called before:

    >>> foo(1, "Ala", 2 + 3 + 4)
    FOO 1 Ala 9
    >>> x = 42
    >>> foo(x, x + 1, x + 2)
    FOO 42 43 44

Note that the argument name is just a label. If we change the value attached to a label for another one, the other labels will not
change – the same happens with the arguments:

    >>> def plus_five(n):
    ...     n = n + 5
    ...     print(n)
    >>> x = 43
    >>> plus_five(x)
    48
    >>> x
    43

It is as normal names (variables) we saw before. There are only two differences:

Firstly, argument names of a function are defined at each function call, and Python attaches the corresponding
argument value to to each of the argument names it just created.

Secondly, the argument names are not available outside the function as they are created when the function is called
and forgotten after the call. That is, if you try now to access
the argument name ``n`` we defined in our :func:`plus_five` function outside of the function's code,
Python tells you it is not defined:

    >>> n
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'n' is not defined

That is, our prim and proper Python cleans up his room at the end of a function call :)


Returning values
----------------

The functions which we have previously used had one important property that is missing in the
functions created by ourselves - they gave back the value they computed
instead of printing it immediately. To
achieve the same effect, you need to use the instruction :keyword:`return`. This is a special
instruction that can be found only in functions.


We can now improve our BMI calculator by adding a function to compute BMI::

    def calc_bmi(height, weight):
        return weight / height ** 2

Finally, as a last example on functions, here is a solution to the problem from the end of the previous chapter:


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


The Entire Christmas tree
=========================

The previous chapter was fairly theoretical, so now we'll use some of this new knowledge
to complete our program to display a Christmas tree.

For the record::

    # xmas.py

    def print_triangle(n):
        for size in range(1, n+1):
            print(size * "*")

    for i in range(2, 5):
        print_triangle(i)

How can we improve the function :func:`print_triangle`, o display the entire segment of the Christmas
tree, not just half of it?


First of all, let’s determine how we want our result to look like for the exact value of argument  ``n``.
It seems to make sense that, ``n`` would be the width. Then for ``n = 5``, we would expect:

::

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

It is not exactly what we have wanted, as it should be aligned in the centre. The method/function
:func:`unicode.center` mentioned in the previous section, helps us:


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

If we know in advance, what size the widest segment is, we can add an additional argument to
:func:`print_segment`,  to align to the width. Combining all of the knowledge we have
acquired up to the moment:


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
    
    
Calendar
--------

Description:

Using data:

.. code-block:: python

  data = [
      ('January', range(31)),
      ('February', range(28)),
      ('March', range(31)),
      ('April', range(30)),
      ('May', range(31)),
      ('June', range(30)),
      ('July', range(31)),
      ('August', range(31)),
      ('September', range(30)),
      ('October', range(31)),
      ('November', range(30)),
      ('December', range(31)),
        ]


Print a calendar:

::

  January

  00 01 02 03 04 05 06
  07 08 09 10 11 12 13
  14 15 16 17 18 19 20
  21 22 23 24 25 26 27
  28 29 30

  February

  00 01 02 03 04 05 06
  07 08 09 10 11 12 13
  14 15 16 17 18 19 20
  21 22 23 24 25 26 27

  ...

  November

  00 01 02 03 04 05 06
  07 08 09 10 11 12 13
  14 15 16 17 18 19 20
  21 22 23 24 25 26 27
  28 29

  December

  00 01 02 03 04 05 06
  07 08 09 10 11 12 13
  14 15 16 17 18 19 20
  21 22 23 24 25 26 27
  28 29 30
  
Hint: Start with a method that will print days of a single month. Run it for each element of the list ‘data’. Rememeber
that every week has 7 days.

    
Improvement of the ‘rock-paper-scissors’ game
---------------------------------------------


Task 1: Let's play some more, i.e. few rounds of a game
```````````````````````````````````````````````````````

Description:

Our game is not the most playable at this point, because it has to be reload every single time. We have to give user
a choice if he wants to continue or end the game after one round. Let's use a `while` loop and keyword `break`.

After every round user should see the question:

::

  Would you like to continue yes/no:


The computer can also be stubborn. If user decides no in previous step, make it ask user addition question:

::

  No!? You will not get away so easily! Prepare yourself for the next round!
  
And start next round. (but without a choice of difficulty level!)


Task 2: Some addiotional screens
````````````````````````````````

Description:

Adjust the game so it has such `screens`:

Welcome screen:

::

    Welcome:
    S - Start
    P - Difficulty level
    Q - Quit

Level selection:

::

    Difficulty level:
    A - Smart
    B - Stupid

Game:

::

    Your choice:
    K - Stone
    P - Paper
    N - Scissors

End of game:

::

  Would you like to continue yes/no:

Take under consideration all previously implemented functionality.

Task 3: User stats
``````````````````

Description:

It is time to collect some statistical data from wins and fails.
At the end of the game (after all rounds) print the number of players and computers wins and who is the winner.

Explore:

1. Count and print percentage values.

2. Print the longest wins sequence both for user and computer.

3. Collect more data for statistical analysis using lists.

  - https://docs.python.org/3.4/tutorial/introduction.html#lists
  - https://docs.python.org/3.4/tutorial/datastructures.html#more-on-lists

  Print the longest wins sequence both for user and computer (ad. 2)
  
Additional task: noughts and crosses
````````````````````````````````````

Description:

Implement the game of noughts and crosses for two players.
Start with the most important part: gameplay, next add menu, players names etc.

An exemplary game can look like this:

::

       1   2   3
    A  . | . | .
    B  . | . | .
    C  . | . | .

    Player X, mark position: A1

       1   2   3
    A  X | . | .
    B  . | . | .
    C  . | . | .

    Player O, mark position: B2

       1   2   3
    A  X | . | .
    B  . | O | .
    C  . | . | .

    Player X, mark position: B1

    ...

       1   2   3
    A  X | O | X
    B  X | O | X
    C  O | X | O

    Draw!

    Would you like to continue? [yes/no]: