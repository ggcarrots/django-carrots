===============
L'Arbre de Noël
===============

Noël arrive (dans plus ou moins longtemps c'est vrai), ce sera le
temps des cadeaux et dans tous les cas celui des sapins de Noël :)
dans tous les magasins.

Comme exercice, je vous propose de dessiner un Arbre de Noël dans la
console.

Nous allons commencer par la version la plus simple puis ajouter des
fonctionnalités au fur et à mesure.

Pour démarrer, commençons par dessiner la moitié d'un Arbre de Noël :

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

C'est pas si mal, mais nous avons du taper beaucoup de chose. Et que
ce passe-t-il si je veux un arbre plus petit ? Ou un plus grand,
composer de centaine d'étoiles pour l'imprimer sur un poster géant au
format A0 ? Oui ça fait certainement beaucoup trop de caractères à
taper, quand bien même on multiplierait les caractères par centaines
(``"*" * 100``, et ainsi de suite). Ça ressemble au genre de tâche
qu'on confierait volontier à un programme ça, non ?


Les listes et les boucles ``for``
=================================

Les boucles sont faites exactement pour ce genre d'actions
répétitives. Pour rester dans l'atmosphère de Noël, imaginez un
instant que vous êtes le Père Noël et que vous deviez
distribuer tous les cadeaux.

Comme vous le savez, les lutins ont une liste précise des personnes
qui méritent un cadeau. La solution la plus simple pour garantir que
personne ne soit oublié serait de prendre la liste dans l'ordre et
d'aller distribuer les cadeaux, dans l'ordre.

Outre les aspects physiques de la tâche [#vitesse]_, la procédure de
distribution des cadeaux pourrait ressembler à cela::


    Disons que la Liste des Gens Bons, contient la liste des personnes
    qui mérite un cadeau.

    Pour chaque personne (alias ``person``), qui se trouve dans la Liste des Gens Bons:
        Distribuer un cadeau à ce ``person``

La disposition du texte ci-dessus n'est pas une erreur, c'est en fait un programme Python déguisé::

    gens_bons = people_who_deserve_gifts()

    for person in gens_bons:
        deliver_gift(person)
        print("Cadeau distribué à :", person)
    print("Tous les Gens Bons ont reçus un cadeau")

La plupart des choses doivent vous sembler familière. On appelle deux fonctions :

:func:`people_who_deserve_gifts` et :func:`deliver_gift` - leur fonctionnement interne est uniquement connu du Père Noël.

Le résultats de la première peut recevoir comme alias `gens_bons`,
afin de se rappeler par la suite à quoi corresponds cette valeur.

Le nouvel élément, c'est la boucle elle-même, qui consiste en :

* Le mot clé :keyword:`for`,
* Le nom du prochain élément de la liste,
* Le mot clé :keyword:`in`,
* Une liste de valeur ou un alias qui y fait référence.
* Les intructions indentée à effectuer pour chaque valeur de la liste (comme dans le cas de :keyword:`if`).

Attendez, nous n'avons encore rien dit à propos des listes, mais
rassurez-vous, le concept de liste en Python est très proche du
concept de liste dans la vie de tous les jours. Nous pouvons
simplement nous représenter une liste en Python comme nous nous
représentons n'importe qu'elle autre liste le reste du temps (liste de
courses, liste d'invités, résultats d'examens, etc.) écrite sur une
papier et numérotées.

Commençons par une liste vide :

    >>> L = []
    >>> L
    []

Quand nous le souhaitons, nous pouvons demander le nombre d'éléments
qui se trouvent dans notre liste en utilisant la fonction:func:`len`.

    >>> len(L)
    0

Essayons avec une autre liste (qui peut avoir le même nom ou pas) :

    >>> L = ["Yara", "Pierre", "Amel"]
    >>> len(L)
    3

Comme pour le cas des tuples, les éléments consécutifs d'une liste
sont séparés par des virgules. À la différence des tuples, les
crochets sont obligatoires.

Pour récupérer la valeur d'un élément d'une position particulière de
la liste (en se souvenant que les index des positions commencent à 0) :

    >>> L[0]
    'Yara'
    >>> L[1]
    'Pierre'
    >>> L[2]
    'Amel'
    >>> L[3]
    Traceback (most recent call last):
     File "<stdin>", line 1, in <module>
    IndexError: list index out of range

On peut aussi utiliser une boucle :keyword:`for`, pour exécuter une
instruction sur chaque élément de la liste:

    >>> for name in L:
    ...     print("Nom:", name)
    ...
    Name: Yara
    Name: Pierre
    Name: Amel

En passant, nous pouvons ainsi afficher la première moitié de notre Arbre de Noël:

    >>> lst = [1, 2, 3]
    >>> for n in lst:
    ...     print("*" * n)
    ...
    *
    **
    ***

Malheureusement, nous devons encore écrire le contenu de la liste. Ce
problème peut-être résolu à l'aide de la fonction :func:`range`. Regardez
``help(range)`` pour apprendre à l'utiliser ou regardez ces exemples :


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

La fonction :func:`range` ne créée pas directement une liste, mais
retourne un générateur. Les générateurs génère les éléments un à un,
ce qui permet de ne pas avoir à stocker l'ensemble des valeurs de la
liste dans la mémoire de l'ordinateur.

Pour obtenir une liste à partir d'un générateur, on utilise la fonction :func:`list`. Si on oublie l'appel à :func:`list`,
le résultat ressemblera à ça :

    >>> range(1, 4)
    range(1, 4)

La fonction :func:`range` à trois formes. La plus simple est la plus
utilisée, est de générer une séquence de nombre de 0 à un nombre
donné. Les autres formes vous permettent de spécifier le chiffre de
départ et le pas d'un nombre à l'autre de la séquence. La séquence
créée n'inclue jamais la borne supérieure.

Affichons un Arbre de Noël plus grand :

    >>> lst = list(range(1, 11))
    >>> lst
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    >>> for i in lst:
    ...     print("*" * i)
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

:func:`range` nous a épargné beaucoup de temps, on peut en gagner encore plus si on ne nomme pas la liste:

    >>> for i in list(range(1, 5)):
    ...     print(i * "#")
    #
    ##
    ###
    ####

Lorsqu'on utilise le mot clé :keyword:`for`, on n'a pas besoin
d'utiliser la fonction :func:`list`.  :keyword:`for` sait gérer le
générateur retourné par `range`. Ce qui nous permet de simplifier
notre programme encore plus.


    >>> for i in range(1, 5):
    ...     print(i * "#")
    #
    ##
    ###
    ####


Rien ne nous empêche de créer une boucle dans une autre boucle,
essayons ! Simplement rappelez-vous d'utiliser l'indentation
appropriée et d'utiliser des alias différents par exemple ``i`` et
``j`` (ou mieux un nom en rapport avec le contenu de la liste):

    >>> for column in range(1, 3):
    ...    for line in range(11, 14):
    ...        print(column, line)
    1 11
    1 12
    1 13
    2 11
    2 12
    2 13

Nous avons une boucle intérieure allant de 11 à 13 (n'oubliez pas que,
14 n'est pas inclus lorsqu'on utilise ``range``) inclue dans une
boucle extérieure qui elle va de 1 à 2.

Comme vous pouvez le voir les éléments de la boucle interieure sont
affichés deux fois, une fois pour chaque itération de la boucle
extérieure.

En utilisant cette technique, on peut répéter les éléments de notre Arbre de Noël :

    >>> for etages in range(3): # répéter 3 fois
    ...    for taille in range(1, 4):
    ...        print(taille * "*")
    *
    **
    ***
    *
    **
    ***
    *
    **
    ***

Avant d'aller plus loin, créez le fichier ``noel.py`` avec ce
programme et essayez de le modifier afin que pour chaque itération de
la boucle extérieure la boucle intérieure soit exécuté une fois de
plus. (Que pour chaque étage on ait une branche de plus).

Vous devriez obtenir le résultat de notre demi Arbre de Noël décrit en début de chapitre.


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
It seems to make sense that, ``n`` would be the width. Then for ``n = 5``, we would expect::

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

.. [#vitesse] En considérant que vous avez 24 heures pour distribuer
              un cadeau à chaque personne de la Terre, il faudrait
              distribuer un cadeau toute les 10 microsecondes.
