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

C'est pas si mal, mais nous avons du taper beaucoup de choses. Et que
se passe-t-il si je veux un arbre plus petit ? Ou un plus grand,
composé de centaines d'étoiles pour l'imprimer sur un poster géant au
format A0 ? Oui ça fait certainement beaucoup trop de caractères à
taper, quand bien même on multiplierait les caractères par centaines
(``"*" * 100``, et ainsi de suite). Ça ressemble au genre de tâche
qu'on confierait volontiers à un programme ça, non ?


Les listes et les boucles ``for``
=================================

Les boucles sont faites exactement pour ce genre d'actions
répétitives. Pour rester dans l'atmosphère de Noël, imaginez un
instant que vous êtes le Père Noël et que vous devez
distribuer tous les cadeaux.

Comme vous le savez, les lutins ont une liste précise des enfants sages
qui méritent un cadeau. La solution la plus simple pour garantir qu'un
enfant ne soit pas oublié serait de prendre la liste et d'aller
distribuer les cadeaux, dans l'ordre.

Outre les aspects physiques de la tâche [#vitesse]_, la procédure de
distribution des cadeaux pourrait ressembler à cela::


    Disons que la liste des enfants sages, contient la liste des enfants
    qui méritent un cadeau.

    Pour chaque enfant (alias ``child``), qui se trouve dans la liste des enfants sages:
        Distribuer un cadeau à cet enfant

La disposition du texte ci-dessus n'est pas une erreur, c'est en fait
un programme Python déguisé::

    children = children_who_deserve_gifts()

    for child in children:
        deliver_gift(child)
        print("Cadeau distribué à :", child)
    print("Tous les enfants sages ont reçus un cadeau")

La plupart des choses doivent vous sembler familières. On appelle deux fonctions :

:func:`children_who_deserve_gifts` et :func:`deliver_gift` - leur fonctionnement interne est uniquement connu du Père Noël.

Le résultats de la première peut recevoir comme alias `children`,
afin de se rappeler par la suite à quoi corresponds cette valeur.

Le nouvel élément, c'est la boucle elle-même, qui consiste en :

* Le mot clé :keyword:`for`,
* Le nom du prochain élément de la liste,
* Le mot clé :keyword:`in`,
* Une liste de valeur ou un alias qui y fait référence.
* Les instructions indentées à effectuer pour chaque valeur de la liste (comme dans le cas de :keyword:`if`).

Attendez, nous n'avons encore rien dit à propos des listes, mais
rassurez-vous, le concept de liste en Python est très proche du
concept de liste dans la vie de tous les jours. Nous pouvons
simplement nous représenter une liste en Python comme nous nous
représentons n'importe quelle autre liste le reste du temps (liste de
courses, liste d'invités, résultats d'examens, etc.) écrite sur une
papier et numérotée.

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

En passant, nous pouvons ainsi afficher la première moitié de notre Arbre de Noël :

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

La fonction :func:`range` ne crée pas directement une liste, mais
retourne un générateur. Les générateurs génèrent les éléments un à un,
ce qui permet de ne pas avoir à stocker l'ensemble des valeurs de la
liste dans la mémoire de l'ordinateur.

Pour obtenir une liste à partir d'un générateur, on utilise la
fonction :func:`list`. Si on oublie l'appel à :func:`list`, le
résultat ressemblera à ça :

    >>> range(1, 4)
    range(1, 4)

La fonction :func:`range` a trois formes. La plus simple, qui est la
plus utilisée, permet de générer une séquence de nombres de 0 à un nombre
donné. Les autres formes vous permettent de spécifier le chiffre de
départ et le pas d'un nombre à l'autre de la séquence. La séquence
créée n'inclut jamais la borne supérieure.

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
14 n'est pas incluse lorsqu'on utilise ``range``) inclue dans une
boucle extérieure qui elle va de 1 à 2.

Comme vous pouvez le voir les éléments de la boucle intérieure sont
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
la boucle extérieure la boucle intérieure soit exécutée une fois de
plus. (Que pour chaque étage on ait une branche de plus).

Vous devriez obtenir le résultat de notre demi Arbre de Noël décrit en début de chapitre.


Les fonctions
=============

Nous avons déjà pu voir comment les fonctions résolve nombre de nos
problèmes. Par contre elle ne solutionne pas tous nos problèmes - ou
du moins pas exactement de la manière dont nous aimerions les
résoudre.

Parfois, nous devons résoudre nous même un problème. Et cela est même
assez fréquent, ce serait assez cool de pouvoir créer des fonctions
qui les solutionnent pour nous.

Voici comment nous pouvons faire en Python:

    >>> def print_triangle(n):
    ...     for size in range(1, n + 1):
    ...         print(size * "*")
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

Regardons de plus près la fonction :func:`print_triangle`::

    def print_triangle(n):
        for size in range(1, n + 1):
            print(size * "*")

La définition d'une fonction commence toujours avec le mot clé :keyword:`def`. Ensuite on donne un nom à la fonction.
Entre les parenthèses, on indique quels sont les noms des arguments passés à la fonction lorsqu'elle est appelée.
Les lignes suivantes définissent les instructions à exécuter lors de l'utilisation de la fonction.

Comme vu dans l'exemple, les instructions peuvent utiliser les alias
des noms des arguments. Le principe opératoire est le suivant - si on
créé une fonction avec trois arguments :

    >>> def foo(a, b, c):
    ...     print("FOO", a, b, c)

Lorsque vous appelez cette nouvelle fonction, vous devez spécifier une valeur pour chacun des arguments.
De la même manière que ce que nous faisions pour appeler les fonctions précédentes :

    >>> foo(1, "Ala", 2 + 3 + 4)
    FOO 1 Ala 9
    >>> x = 42
    >>> foo(x, x + 1, x + 2)
    FOO 42 43 44

On notera qu'un argument est simplement un alias, si on modifie la
valeur liée à cet alias pour une autre valeur, les autres alias ne
sont pas modifiés - c'est la même chose pour les arguments:

    >>> def plus_five(n):
    ...     n = n + 5
    ...     print(n)
    >>> x = 43
    >>> plus_five(x)
    48
    >>> x
    43

ça fonctionne comme pour les alias (variables) que nous avons vu
précédement. Il y a seulement deux différences :


Premièrement, les alias des arguments d'une fonction sont définis à
chaque appel de la fonction, et Python attache la valeur
correspondante à la valeur de l'argument à l'alias de l'argument qu'il
vient de créér.


Deuxièmement, les alias des arguments ne sont pas utilisable à
l'extérieur de la fonction car ils sont créé lors de l'appel de la
fonction et oublié à la fin de celle-ci. C'est pourquoi, si vous essayez d'accéder à la valeur ``n`` que nous avons définie dans notre fonction :func:`plus_five` à l'extérieur du code de la fonction Python vous dit qu'elle n'est pas définie :

    >>> n
    Traceback (most recent call last):
      File "<stdin>", line 1, in <module>
    NameError: name 'n' is not defined

C'est comme ça notre cher Python fait le ménage à la fin d'un appel de fonction :)    
    
    
Retourner un résultat
---------------------

Une des propriétés principales des fonctions que nous avons utilisé
précédement manque cruellement à nos fonctions — elles retournaient le
résultat qu'elle avait calculé au lieu de l'écrire directement. Pour
obtenir un comportement similaire, il faut utiliser l'instruction
:keyword:`return`. C'est une instruction spécifique qui ne fonctionne
qu'au sein d'une fonction.

On peut améliorer notre calculateur d'IMC en ajoutant une fonction
permettant le calcul de l'IMC::

    def calculate_imc(height, weight):
        return weight / height ** 2

Pour finir, comme dernier exemple de fonction, voici la solution au
problème posé à la fin du chapitre précédent :


.. testcode::

    # noel.py

    def print_triangle(n):
        for size in range(1, n + 1):
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


Un Arbre de Noël entier
=======================

Le chapitre précédent était principalement de la théorie. Utilisons
nos nouvelles connaissances pour terminer notre programme et afficher
notre Arbre de Noël.


Voici à quoi ressemble notre fichier actuel::

    # noel.py

    def print_triangle(n):
        for size in range(1, n+1):
            print(size * "*")

    for i in range(2, 5):
        print_triangle(i)

Comment pouvons-nous améliorer la fonction :func:`print_triangle`,
pour afficher un Arbre de Noël entier et non juste la moitié ?


Tout d'abord, essayons de déterminer le résultat attendu en fonction de la valeur de l'argument ``n``. 
Il parait naturel que ``n`` soit la largeur. Ainsi pour ``n = 5`` on s'attendrait à::

      *
     ***
    *****

Il est intéressant de noter que chaque ligne possède deux étoiles de
plus que la ligne précédente. Nous pouvons donc utiliser le troisième
argument de :func:`range`:

.. testcode::

    def print_segment(n):
        for size in range(1, n + 1, 2):
            print(size * "*")

    print_segment(5)

.. testoutput::

    *
    ***
    *****

Ce n'est pas exactement ce à quoi on s'attendait, il y a effectivement
le bon nombre d'étoiles mais on souhaiterait qu'elle soit aligné au
centre.

La fonction :func:`unicode.center` que vous avez peut-être trouvé en
répondant à la question de fin du chapitre précédent, peut nous aider:


.. testcode::

    def print_segment(n):
        for size in range(1, n + 1, 2):
            print((size * "*").center(n))

    print_segment(5)

.. testoutput::
    :options: +NORMALIZE_WHITESPACE

      *
     ***
    *****

Cependant, un nouveau problème apparait :

.. testcode::

    def print_segment(n):
        for size in range(1, n + 1, 2):
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

Si nous avions un moyen de connaitre à l'avance la taille du segment
le plus grand, nous pourrions ajouter un argument supplémentaire à
:func:`print_segment`, pour faire le centrage sur cette largeur. En
combinant toute la connaissance acquise :


.. testsetup:: tree-final

    input.queue.append("7")

.. testcode:: tree-final

    def print_segment(n, total_width):
        for size in range(1, n + 1, 2):
            print((size * "*").center(total_width))

    def print_tree(size):
        for i in range(3, size + 1, 2):
            print_segment(i, size)

    print("Choisissez la taille de votre Arbre de Noël :")
    n = int(input())
    print_tree(n)

.. testoutput:: tree-final
    :options: +NORMALIZE_WHITESPACE

    Choisissez la taille de votre Arbre de Noël :
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


Pour aller plus loin
--------------------

Réaliser une classe ``XMASTree`` qui pour une taille donnée et lors de
l'appel de la méthode ``draw`` va afficher les résultats suivants
(pour les tailles 1, 2 et 3) :

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
