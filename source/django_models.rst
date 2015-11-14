
Models
======

The next step is to define the model of our application. The model describes what can be
stored in the database and how. From a Python point of view, a model is a basic class which inherits from ``models.Model``.

Our application will include questions and answers, so we'll create two models: ``Poll`` and ``Choice``. The model ``Poll`` contains the content of the questions and the date of publication. The model
``Choice`` contains a reference to the relevant questions, the content of the responses and the number of
votes.

In the file ``polls/models.py`` type::

    from django.db import models

    class Poll(models.Model):
        question = models.CharField(max_length=200)
        pub_date = models.DateTimeField('date published')

    class Choice(models.Model):
        poll = models.ForeignKey(Poll)
        choice_text = models.CharField(max_length=200)
        votes = models.IntegerField(default=0)

By adding new models we have changed the database schema. We need to create migration files containing
instructions to add the corresponding new tables in database, using the ``makemigrations`` coammand and
then execute these migrations files, using the ``migrate`` command.

.. code-block:: sh

    (workshops) ~/carrots$ python manage.py makemigrations
    Migrations for 'polls':
      0001_initial.py:
        - Create model Choice
        - Create model Poll
        - Add field poll to choice

.. code-block:: sh

    (workshops) ~/carrots$ python manage.py migrate
    Operations to perform:
      Synchronize unmigrated apps: staticfiles, messages
      Apply all migrations: admin, contenttypes, polls, auth, sessions
    Synchronizing apps without migrations:
      Creating tables...
        Running deferred SQL...
      Installing custom SQL...
    Running migrations:
      Rendering model states... DONE
      Applying polls.0001_initial... OK

That’s it! However, probably we would like to be able to edit objects. The easiest way is to do it in

We create a file ``polls/admin.py``, which includes::

    from django.contrib import admin
    from polls.models import Poll, Choice

    admin.site.register(Poll)
    admin.site.register(Choice)

Now, the ``Poll`` and ``Choice`` models will be available from the administration panel.

.. note::

    Some changes require a server restart. In the console with the server
    running, do ``Ctrl+C`` and then ``python manage.py runserver`` again.

When we go back to http://localhost:8000/admin/ we will see that a new bookmark ``Polls`` has appeared.


Playing in the console
----------------------

Django provides its own console. It is a simple Python console (where we can do exactly the same thing
as when you activate the command ``python``), but we can also use the tools and models of Django.

.. code-block:: sh

   (workshops) ~/carrots$ python manage.py shell

Once you are in the shell, type::

    >>> from polls.models import Poll, Choice

All the surveys are the database, there's nothing here, so we get an empty list::

    >>> Poll.objects.all()
    []

We create the first survey::

    >>> import datetime
    >>> p = Poll(question="What's new?", pub_date=datetime.datetime.now())

Save the poll in the database. For this purpose, you always need to call ``save()``::

    >>> p.save()

Each object in the database is assigned to a unique ID::

    >>> p.id
    1

``p`` is a simple object. We can read its attributes::

    >>> p.question
    "What's new?"
    >>> p.pub_date
    datetime.datetime(2014, 10, 18, 13, 0, 0, 775217)

After changing the attributes we again call ``save()`` to save changes::

    >>> p.question = "What's up?"
    >>> p.save()

``objects.all()`` returns a list of all the objects in the database::

    >>> Poll.objects.all()
    [<Poll: Poll object>]

Django models are classes, which can define methods. A method is a function that gets an extra
parameter ``self``, which is the current object (e.g, the current questionnaire). Methods in classes (
models) allow you to add additional behaviors or change the existing ones.

One of the methods is ``__str__()``, which allows you to change the display of the model (a
questionnaire or a question). ``<Poll: Poll object>`` doesn’t tell us much. Let's fix that by adding the
method ``__str__`` to ``Poll`` and ``Choice``::

    class Poll(models.Model):
        # ...
        def __str__(self):
            return self.question

    class Choice(models.Model):
        # ...
        def __str__(self):
            return self.choice_text

Django will use these methods for displaying objects, not just in the console but also in the administration interface.

We can also add other methods.  In ``carrots/polls/models.py``, append the following (comments ``#…``
mean the code located in the file)::

    import datetime
    from django.utils import timezone
    # ...
    class Poll(models.Model):
        # ...
        def was_published_recently(self):
            return self.pub_date >= datetime.datetime.now() - datetime.timedelta(days=1)

Note that we had to add ``import datetime`` at the beginning of the file to use objects representing the time in Python.

Let’s save the changes and run the intepreter with the command ``python manage.py`` once again::

    >>> from polls.models import Poll, Choice

    # Let’s find out if our method __str__() works
    >>> Poll.objects.all()
    [<Poll: What's up?>]

Until now, we have used the method ``all`` to get a list of all objects of a
defined type (e.g. all questions). There are other methods that allow us to find objects that meet
certain conditions:

.. code-block:: python

    # Django provides a very easy search of the objects in the database. Let's look at
    some examples.
    >>> Poll.objects.filter(id=1)
    [<Poll: What's up?>]
    >>> Poll.objects.filter(question__startswith='What')
    [<Poll: What's up?>]
    >>> Poll.objects.get(pub_date__year=2014)
    <Poll: What's up?>

    # The attempt to retrieve a nonexistent object will make Python protest, but we are already used to this.
    >>> Poll.objects.get(id=2)
    Traceback (most recent call last):
        ...
    DoesNotExist: Poll matching query does not exist. Lookup parameters were {'id': 2}

    # Let’s try our own method.
    >>> p = Poll.objects.get(pk=1)
    >>> p.was_published_recently()
    True

We can also have access to the answers (``Choice``):

.. code-block:: python

    # For now our questionnaire does not include any questions. Let's add some!
    >>> p.choice_set.all()
    []

    # .. We will use the method "create" to get an object "Choice".
    >>> p.choice_set.create(choice_text='Not much', votes=0)
    <Choice: Not much>
    >>> p.choice_set.create(choice_text='The sky', votes=0)
    <Choice: The sky>
    >>> c = p.choice_set.create(choice_text='Just hacking again', votes=0)

    # With the object "Choice" we can find the questionnaire  to which it belongs.
    >>> c.poll
    <Poll: What's up?>

    # ...Vice versa, we can find all of the answers to the questionnaire
    >>> p.choice_set.all()
    [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]
    >>> p.choice_set.count()
    3

    # And now something more difficult. What does this command do?
    >>> Choice.objects.filter(poll__pub_date__year=2014)
    [<Choice: Not much>, <Choice: The sky>, <Choice: Just hacking again>]

    # Finally, let's remove one of the questions. Use the method ``delete``.
    >>> c = p.choice_set.filter(choice_text__startswith='Just hacking')
    >>> c.delete()

Summary
-------

* We create models by defining classes inheriting from ``models.Model`` in ``polls/models.py file``.
* After creating a new model, we have to remember to run python ``manage.py syncdb``.
* To download every object in the model::

    Poll.objects.all()

* To download the object which satisfies the condition::

    Poll.objects.filter(question__startswith='What')

* To download a single object::

    Poll.objects.get(id=2)
