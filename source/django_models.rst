
Models
======

La prochaine étape consiste en la définition du modèle de notre application. Le modèle décrit ce qui peut être stocké dans la base de données
et comment cela sera stocké. Du point de vue de Python, ce n'est qu'une classe standard, qui hérite de ``models.Model``.

Notre application inclura des questions et leurs réponses, nous allons donc créer deux modèles : ``Poll`` et ``Choice``. Le modèle ``Poll`` contient le contenu des questions ainsi que la date de publication. Le modèle
``Choice`` contient une référence vers la question adéquate, le contenu des réponses et le nombre de votes.

Dans le fichier ``polls/models.py`` nous écrivons::

    from django.db import models

    class Poll(models.Model):
        question = models.CharField(max_length=200)
        pub_date = models.DateTimeField('date published')

    class Choice(models.Model):
        poll = models.ForeignKey(Poll)
        choice_text = models.CharField(max_length=200)
        votes = models.IntegerField(default=0)

En ajoutant de nouveaux modèles, nous avons changé la disposition de la base de données. Nous devons appliquer la commande ``syncdb`` une nouvelle fois
afin que les tables correspondantes aux nouveaux modèles apparaissent dans la base de données.

.. warning::
    Après avoir exécuté la commande ``syncdb``, vous ne pouvez pas ajouter de nouveaux champs dans le modèle. Vous pouvez seulement ajouter de nouveaux modèles. Il y a plusieurs façons d'éviter cela, mais … ceci est une autre histoire.

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py syncdb
   Creating tables ...
   Creating table polls_poll
   Creating table polls_choice
   Installing custom SQL ...
   Installing indexes ...
   Installed 0 object(s) from 0 fixture(s)

C'est tout ! Par contre, vous souhaitez probablement avoir la possibilité d'éditer les objets. La façon la plus simple de le faire c'est d'utiliser
l'interface d'administration.

Nous créons un fichier ``polls/admin.py`` qui contient::

    from django.contrib import admin
    from polls.models import Poll, Choice

    admin.site.register(Poll)
    admin.site.register(Choice)

Ainsi ``Poll`` et ``Choice`` seront disponibles dans l'interface d'administration.

.. note::

    Certaines modifications nécessitent un redémarrage du serveur. Dans la console où le serveur a été activé, appuyez sur ``Ctrl+C`` puis relancez ``python manage.py runserver``.

Lorsque nous revenons sur la page http://localhost:8000/admin/ nous allons voir apparaître un nouvel onglet ``Polls``


Jouer dans la console
----------------------

Django fournit sa propre console. C'est une simple console Python (où nous pouvons faire exactement les mêmes choses
que lorsque nous exécutons la commande ``python``), mais nous pouvons aussi utiliser les outils et modèles de Django.

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py shell

Lorsque vous êtes dans le shell commencez par::

    >>> from polls.models import Poll, Choice

et affichez tous les sondages de la base de données ; mais il n'y a rien ici pour le moment, donc nous obtenons une liste vide::

    >>> Poll.objects.all()
    []

Nous créons le premier sondage::

    >>> import datetime
    >>> p = Poll(question="What's new?", pub_date=datetime.datetime.now())

Sauvegardez le sondage dans la base de données. Pour cela, vous devez toujours appeler la fonction ``save()``::

    >>> p.save()

Chaque objet dans la base de données est assigné à un identifiant unique::

    >>> p.id
    1

``p`` est un objet normal dont nous pouvons lire les attributs::

    >>> p.question
    "What's new?"
    >>> p.pub_date
    datetime.datetime(2014, 10, 18, 13, 0, 0, 775217)

Après la modification des attributs, nous devons encore appeler ``save()`` pour sauvegarder les changements::

    >>> p.question = "What's up?"
    >>> p.save()

``objects.all()`` retourne une liste de tous les objets de la base de données::

    >>> Poll.objects.all()
    [<Poll: Poll object>]

Les modèles de Django sont des classes et les classes peuvent avoir des méthodes. Une méthode est une fonction qui
prends un paramètre supplémentaire ``self``, représentant l'objet courant (par exemple, le sondage actuel). Les méthodes
dans les classes (modèles) vous permettent de définir des comportements supplémentaire ou de modifier les comportements existants.

Une des méthodes par défaut est ``__str__()``, qui vous permet de modifier l'affichage du modèle (un
sondage ou une question). ``<Poll: Poll object>`` n'indique pas grand-chose. Corrigeons cela en ajoutant la méthode
 ``__str__`` aux classes ``Poll`` et ``Choice``::

    class Poll(models.Model):
        # ...
        def __str__(self):
            return self.question

    class Choice(models.Model):
        # ...
        def __str__(self):
            return self.choice_text

Django utilisera ces méthodes pour afficher les objets, pas uniquement dans la console, mais aussi dans
l'interface d'administration.

Nous pouvons aussi ajouter d'autres méthodes. Dans le fichier ``carrots/polls/models.py`` ajoutez (ici, les commentaires ``#…`` 
indique où se trouve le code dans le fichier)::

    import datetime
    from django.utils import timezone
    # ...
    class Poll(models.Model):
        # ...
        def was_published_recently(self):
            return self.pub_date >= datetime.datetime.now() - datetime.timedelta(days=1)

Notez que nous devons importer le module ``datetime`` avec ``import datetime`` afin de pouvoir manipuler les objets représentants les dates et les heures en Python.

Sauvegardons les changements et lançons une nouvelle fois l'interpréteur avec la commande ``python manage.py``::

    >>> from polls.models import Poll, Choice

    # Vérifions si notre méthode __str__() fonctionne
    >>> Poll.objects.all()
    [<Poll: What's up?>]

Jusqu'à présent, nous avions utilisé la méthode ``all`` qui vous permettait d'obtenir la liste de tous les objets d'un
type défini (par exemple, toutes les questions). Il y a d'autres méthodes qui permettent de trouver des objets répondants à certaines 
conditions:

.. code-block:: python

    # Django fournit une recherche très simple des objets dans la base de données. Voyons quelques exemples.
    >>> Poll.objects.filter(id=1)
    [<Poll: What's up?>]
    >>> Poll.objects.filter(question__startswith='What')
    [<Poll: What's up?>]
    >>> Poll.objects.get(pub_date__year=2014)
    <Poll: What's up?>

    # La tentative de récupération d'un objet non présent entrainera une violente protestation de Python.
    # Mais nous sommes déjà habitués à cela.
    >>> Poll.objects.get(id=2)
    Traceback (most recent call last):
        ...
    DoesNotExist: Poll matching query does not exist. Lookup parameters were {'id': 2}

    # Essayons notre propre méthode.
    >>> p = Poll.objects.get(pk=1)
    >>> p.was_published_recently()
    True

Nous pouvons avoir accès aux réponses (``Choice``) des questions:

.. code-block:: python

    # Pour le moment notre sondage n'inclut aucune question. Ajoutons-en !
    >>> p.choice_set.all()
    []

    # .. par exemple trois. Nous allons utiliser la méthode "create". En résultat, nous obtenons un objet "Choice".
    >>> p.choice_set.create(choice_text='Not much', votes=0)
    <Choice: Not much>
    >>> p.choice_set.create(choice_text='The sky', votes=0)
    <Choice: The sky>
    >>> c = p.choice_set.create(choice_text='Just hacking again', votes=0)

    # Avec l'objet "Choice" nous pouvons trouver le sondage auquel la réponse correspond.
    >>> c.poll
    <Poll: What's up?>

    # ...et vice versa, toutes les réponses d'un sondage
    >>> p.choice_set.all()
    [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]
    >>> p.choice_set.count()
    3

    # Et maintenant quelque chose de plus difficile. Que fait cet appel?
    >>> Choice.objects.filter(poll__pub_date__year=2014)
    [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]

    # Finalement, enlevons une des questions. Utilisons la méthode ``delete``.
    >>> c = p.choice_set.filter(choice_text__startswith='Just hacking')
    >>> c.delete()

Récapitulatif
-------------

* Nous créons des modèles en définissant des classes héritant de ``models.Model`` du fichier ``polls/models.py``.
* Après la création d'un nouveau modèle, nous devons nous souvenir d'exécuter ``python manage.py syncdb``.
* Pour récupérer tous les objets d'un modèle::

    Poll.objects.all()

* Pour récupérer l'objet qui correspond à une condition::

    Poll.objects.filter(question__startswith='What')

* Pour récupérer un seul objet::

    Poll.objects.get(id=2)

