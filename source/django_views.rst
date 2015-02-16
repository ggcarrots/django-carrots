
Afficher des sites Web
======================

La connexion à l'adresse principale http://localhost:8000/ affiche toujours une affreuse page d'erreur. Cela ne peux plus durer !

Il est préférable de commencer à travailler sur un site Web après avoir préparé un plan des URLs (adresses). Nous savons
que nous souhaitons voir une liste de tous les sondages du site, de permettre aux utilisateurs de voter et d'afficher
l'ensemble des résultats du sondage.

Ouvrons le fichier ``urls.py`` une nouvelle fois et ajoutons quatre nouvelles entrées. Finalement, le fichier devrait ressembler à::

  from django.conf.urls import patterns, include, url

  from django.contrib import admin
  admin.autodiscover()

  urlpatterns = patterns('',
      url(r'^polls/$', 'polls.views.index'),
      url(r'^polls/(?P<poll_id>\d+)/$', 'polls.views.detail'),
      url(r'^polls/(?P<poll_id>\d+)/results/$', 'polls.views.results'),
      url(r'^polls/(?P<poll_id>\d+)/vote/$', 'polls.views.vote'),
      url(r'^admin/', include(admin.site.urls)),
  )

Regardons encore une fois cet exemple. Chaque argument passé à la fonction ``patterns`` (sauf le tout premier, mais nous reviendrons dessus plus tard) détermine notre motif d'URL (adresse). Le motif est écrit à l'aide des `expression rationnelle <http://fr.wikipedia.org/wiki/Expression_rationnelle#Notations_:_impl.C3.A9mentations_et_standardisation>`_. C'est un terme technique compliqué pour un minuscule langage utilisé pour
la représentation concise des motifs de texte.


Lorsque un utilisateur essaye d'entrer une adresse spécifique dans notre site Web, tel que: http://localhost:8000/polls/1/,
Django sélectionne la troisième partie de l'URL, après la barre oblique (dans ce cas, ``polls/1/``) et essaie de la passer dans une expression régulière pour correspondre à ``urlpatterns``. Prenons une de ces expressions en exemple::

  r'^polls/(?P<poll_id>\d+)/vote/$'

C'est une chaîne de caractères normale (sauf, peut être pour le ``r`` au début, qui est utilisé uniquement par commodité). 
Lorsque nous essayons d'adapter le texte à la chaîne de caractères (nous pensons toujours au ``polls/1/``), nous devons
nous rappeler des règles suivantes:

.. admonition:: Expressions rationnelles:
   :class: alert alert-info

   * Chaque lettre et nombre de l'expression rationnelle s'applique à la même lettre/nombre de la chaîne de caractères adapté. De même avec la
     barre oblique (``/``), l'espace (``' '`` ), le souligné (``_``) et le trait d'union (``-``).
   * ``^`` s'applique seulement au début de la chaîne de caractères (“le début” est ici un symbole abstrait
     avant le premier caractère)
   * ``$`` correspond seulement à la fin de la chaîne de caractères (d'une façon similaire au “début”).
   * Le point (``.``) correspond à n'importe quel caractère.
   * Si plusieurs caractères étaient placés dans des crochets, comme ceci: ``[abde]``, le groupe compte pour une unité
     et correspondra à n'importe quel caractère compris dans le groupe.
   * Il y a une notation abrégée pour de tels groupes. Plutôt que d'écrire toutes les minuscules de l'alphabet,
     nous pouvons écrire ``[a-z]`` pour correspondre à n'importe quelle lettre minuscule. De même pour les lettres majuscules ``[A-Z]`` ou les nombres ``[0-9]``.
   * Correspondre à un nombre peut encore être plus court en utilisant la marque ``\d``.
   * Si après n'importe quelle expression ci-dessus nous plaçons un ``?`` il sera alors considéré comme optionnel. Cela signifie
     que si dans la chaîne de caractères correspondante il n'y a pas de telle expression, la correspondance restera possible. Si elle existe, alors elle y correspondra.
   * Si nous plaçons un ``*`` après l'expression, elle correspondra à n'importe quel nombre de répétitions même pour un nombre de
     zéro, ou pour ainsi dire, comme s'il était optionnel.
   * Si nous plaçons un ``+`` après l'expression elle correspondra à n'importe quel nombre de répétitions, sauf à zéro
     (l'expression doit apparaitre au moins une fois).
   * Si plusieurs caractères étaient placés dans des parenthèses, tel que ``(\d \d)`` ils seront traités comme un groupe
     et tous les modificateurs fonctionneront sur l'ensemble de caractères du groupe. Si vous écrivez aussi avec le ``(? P <NOM> chaîne)``, le groupe peut être par la suite appelé avec NOM. C'est très courant lorsque l'on travaille avec Django.

Fiou ... il y a tant de règles, mais personne ne se rappelle vraiment de toutes. Celles ci-dessus sont 
suffisantes pour la majorité des cas.

Voyez-vous déjà que la simple phrase correspond à ``polls/1/?`` Pourquoi ?

Une fois que Django trouve une correspondance il va regarder la seconde partie de la ligne. Elle définie la vue,
qui est appelée pour créer le site pour l'utilisateur. Pour ``polls/1/`` cela sera ``polls.views.detail``. Tous les
groupes nommés seront transférés à la vue comme argument ayant le même nom.

Première vue
------------

Ok, voyons voir comment cela fonctionne dans la pratique. Malheureusement, en entrant l'adresse
http://localhost:8000/polls/1/ cela ne se fini pas très bien::

  ViewDoesNotExist at /polls/1/

  Could not import polls.views.detail. View does not exist in module polls.views.

Cela est dû à la non-définition de la vue (Django nous indique qu'il cherchait ``polls.views.
detail``, malheureusement, il n'a rien trouvé).

Ouvrons le fichier ``polls/views.py`` et ajoutons quelques nouvelles fonctionnalités::

    from django.http import HttpResponse

    def index(request):
        return HttpResponse("Hello, world. You're at the poll index.")

    def detail(request, poll_id):
        return HttpResponse("You're looking at poll %s." % poll_id)

    def results(request, poll_id):
        return HttpResponse("You're looking at the results of poll %s." % poll_id)

    def vote(request, poll_id):
        return HttpResponse("You're voting on poll %s." % poll_id)

Ce sont les vues les plus simples possibles. Elles ne renvoient pas de
chaîne de caractères régulières, tel que la fonction qui construit un
arbre de Noël en Python, car elles doivent parler le protocole HTTP,
qui est un peu plus compliqué (Il serait intéressant ici de voir la
page dans un navigateur lorsque vous entrez l'adresse
http://localhost:8000/polls/1/).


Une vue qui fait réellement quelque chose
-----------------------------------------

Pour le moment nos vues ne font pas grand-chose. Donnons leur plus de travail !

Tout ce dont Django attends d'une vue, c'est quelle retourne un objet
`HttpResponse <https://docs.djangoproject.com/en/1.4/ref/request-response/#django.http.HttpResponse>`_
ou qu'elle émette une exception. Tous le reste est sous votre contrôle. Par exemple, nous pouvons utilisez les fonctions que nous avons apprises dans le mode interactif pour afficher les sondages à l'utilisateur.


Au début du fichier ``polls/views.py`` ajoutez::

    from django.http import HttpResponse
    from polls.models import Poll

Étendez la fonction ``index`` pour quelle ressemble à ceci:

.. code-block:: python

  def index(request):
      latest_poll_list = Poll.objects.all().order_by('-pub_date')[:5]
      output = ', '.join([p.question for p in latest_poll_list])
      return HttpResponse(output)

.. note::

    Maintenant nous ne donnons plus l'intégralité du fichier car il serait trop long. Seules les changements importants sont rapportés.

Cela fonctionne ! Il y a seulement un problème avec cet exemple : nous définissons dans la vue non seulement ce qui doit être
retourné, mais aussi dans quel format cela doit être affiché à l'utilisateur du site. Une des compétences principale
d'un développeur, c'est sa faculté à distinguer ces deux choses indépendantes.

Les programmeurs Django y ont pensé et ont décidé de créer un système de templates:

Au début du fichier ``polls/views.py`` ajoutez::

  from django.template import Context, loader

Ce qui nous permet d'utiliser le système de templates.

Dans le même fichier, étendez la fonction ``index`` afin de la faire ressembler à ceci::

  def index(request):
      latest_poll_list = Poll.objects.all().order_by('-pub_date')[:5]
      t = loader.get_template('polls/index.html')
      c = Context({
          'latest_poll_list': latest_poll_list,
      })
      return HttpResponse(t.render(c))

Les fonctions: ``get_template`` (qui trouve un template) et ``render`` (qui transforme un template en un texte
qui sera finalement envoyé à l'utilisateur) sont responsables de la gestion de nos templates.

Le code est un peu plus long, mais nous allons bientôt voir que tout est bien plus clair. Par contre, premièrement
chargeons la page http://localhost:8000/polls/ pour voir le résultat de notre travail::

  TemplateDoesNotExist at /polls/
  polls/index.html

Oups ! Bien, nous n'avons toujours pas ajouter de template. Pour ce faire, créez un fichier ``polls/templates/polls/index.html`` et insérez à l'intérieur:

.. code-block:: django

  {% if latest_poll_list %}
  <ul>
      {% for poll in latest_poll_list %}
          <li><a href="/polls/{{ poll.id }}/">{{ poll.question }}</a></li>
      {% endfor %}
  </ul>
  {% else %}
      <p>No polls are available.</p>
  {% endif %}

.. note::
    Les ``templates`` de l'application sont situés dans le répertoire ``templates des applications`` et la fonction get_template recherche les templates dans ces répertoires, c'est pourquoi nous n'avons pas eu besoin de donner le chemin complet ``polls/templates/polls/index.html``, ``polls/index.html.`` suffisait.

Lorsque vous rechargez la page dans le navigateur, vous devriez voir une liste de tous les sondages créés auparavant.

.. note::

    Si vous rafraichissez la page et que voyez toujours une erreur, vous devez redémarrer le serveur. Dans la console où le serveur est, appuyez sur ``Ctrl + C`` et exécutez ``python manage.py runserver`` une nouvelle fois. Cela devrait maintenant fonctionner.

.. note::

   HTML et CSS sont des formats qui définissent l'apparence des pages Web. Nous allons utiliser les templates de Django pour générer le code HTML. Une bonne description du HTML est présenté dans le livre
   `Interactive Data Visualization for the Web <http://chimera.labs.oreilly.com/books/1230000000345/index.html>`_.
   Les caractéristiques incroyables du Web sont que les codes HTML et CSS de n'importe quel site Web sont publiques. Nous vous recommandons de regarder le code de vos sites favoris.

Vous allez devoir utiliser un template dans presque toutes les vues. Par conséquent, Django propose une fonction 
``render`` qui vous permet de faire cela d'une façon plus courte:

Veuillez corriger le début du fichier ``polls/views.py`` pour correspondre à ceci::

  from django.shortcuts import render
  from polls.models import Poll

Veuillez corriger la fonction ``index`` pour ressembler à ceci::

  def index(request):
      latest_poll_list = Poll.objects.all().order_by('-pub_date')[:5]
      return render(
          request,
          'polls/index.html',
          {'latest_poll_list': latest_poll_list})


Retourner un code 404
---------------------

Maintenant, concentrons-nous sur la vue détaillant un sondage - un site qui affiche les questions à partir
d'un sondage précis.

Au début du fichier ``polls/views.py`` ajoutez::

    from django.http import Http404

``Http404`` est une exception partagée par Django. Nous pouvons utiliser cette exception lorsque notre application ne peux
trouver le sondage demandé par l'utilisateur (en écrivant ``raise Http404``). Ainsi, le navigateur affichera la page d'erreur 404.


.. note::

   Vous pouvez changer la page affichée par Djanga en cas d'erreur 404 (la page n'existe pas) et 500 (erreur inattendue du serveur). Pour ce faire, vous devez créer des templates ``404.html`` et ``500.html``. Avant de vérifier que cela fonctionne, changez ``DEBUG`` dans le fichier ``settings.py`` à ``False``. Sinon, Django continuera d'afficher ses pages jaunes.

Changez la fonction ``detail`` comme suit::

    def detail(request, poll_id):
        try:
            p = Poll.objects.get(id=poll_id)
        except Poll.DoesNotExist:
            raise Http404
        return render(request, 'polls/detail.html', {'poll': p})

Puis créez le fichier ``polls/templates/polls/detail.html`` ayant pour contenu:

.. code-block:: django

    <h1>{{ poll.question }}</h1>
    <ul>
    {% for choice in poll.choice_set.all %}
        <li>{{ choice.choice_text }}</li>
    {% endfor %}
    </ul>


Gestion de formulaire
---------------------

Changeons le template ``polls/templates/polls/details.html``, en ajoutant un simple formulaire HTML.

Changez le fichier ``polls/templates/polls/details.html`` comme suit:

.. code-block:: django

  <h1>{{ poll.question }}</h1>

  {% if error_message %}<p><strong>{{ error_message }}</strong></p>{% endif %}

  <form action="/polls/{{ poll.id }}/vote/" method="post">
  {% csrf_token %}
  {% for choice in poll.choice_set.all %}
      <input type="radio" name="choice" id="choice{{ forloop.counter }}" value="{{ choice.id }}" />
      <label for="choice{{ forloop.counter }}">{{ choice.choice_text }}</label><br />
  {% endfor %}
  <input type="submit" value="Vote" />
  </form>

.. note::

   ``{% csrf_token %}`` est une méthode très magique pour protéger vos sites Web d'une nouvelle forme d'attaque contre les utilisateurs. Plus d'information dans la
   `documentation Cross Site Request Forgery <https://docs.djangoproject.com/en/1.4/ref/contrib/csrf/>`_.

Les lecteurs attentifs noteront que le formulaire est envoyé à l'adresse ``/polls/{{ poll.id }}/vote/``, qui n'est pas
encore supporté par les formulaires. Maintenant nous allons ajouter le support des formulaires. 

Au début du fichier ``polls/views.py`` ajoutez::

    from django.http import HttpResponseRedirect
    from django.core.urlresolvers import reverse
    from django.shortcuts import get_object_or_404
    from polls.models import Choice

Corrigez la fonction ``vote`` function, comme suit::

    def vote(request, poll_id):
        p = get_object_or_404(Poll, id=poll_id)
        try:
            selected_choice = p.choice_set.get(id=request.POST['choice'])
        except (KeyError, Choice.DoesNotExist):
            # If user would choose the wrong option, show error
            return render(request, 'polls/detail.html', {
                'poll': p,
                'error_message': "You have to choose correct option.",
            })

        # Sauvegarde le nouveau nombre de votes
        selected_choice.votes += 1
        selected_choice.save()
        # Redirige un utilisateur à la vue détaillée du sondage, sur laquelle il ou elle vient de voter
       return HttpResponseRedirect(reverse('polls.views.results', args=(p.id,)))

Dans la vue il y a un ensemble de nouvelles idées que nous n'avons pas encore détaillé.

L'objet ``request`` contient les données envoyées par l'utilisateur et ``request.POST`` contient les données du formulaire envoyées par l'utilisateur. De cette façon nous savons quelle option a été sélectionnée.

Voilà qui arrive la question importante. Il peut arriver qu'une vue reçoive une réponse inexistante. Nous
devons toujours vérifier les données provenant de l'utilisateur et répondre même aux situations où les données n'ont
aucun sens. C'est ce qui arrive dans la clause :keyword:`except`. Ensuite nous redirigeons l'utilisateur sur
le sondage et affichons l'erreur.

Si l'utilisateur sélectionne l'option correcte, nous pouvons augmenter le nombre de votes et sauvegarder les modifications. Ensuite
nous effectuons une redirection avec ``HttpResponseRedirect`` vers la vue détaillée du sondage précédemment inscrite.

Un autre problème important : après avoir voter nous pouvions juste afficher la page, comme à la fin de la vue des
détails (en utilisant render). Malheureusement, cela pourrait provoquer le renvoie du sondage. Si l'utilisateur
commence à jouer avec les boutons précédent et suivant du navigateur, ou simplement en rafraichissant la page (en
appuyant sur F5). En résumé, après que le formulaire correct soit soumis (dans ce cas, après le vote à un sondage), nous
devons effectuer une redirection en utilisant HttpResponseRedirect.

À la fin nous devons encore développer une vue pour les résultats du sondage, affichés après un vote.

Corrigez la fonction ``results``, comme suit::

  def results(request, poll_id):
      p = get_object_or_404(Poll, id=poll_id)
      return render(request, 'polls/results.html', {'poll': p})

Et créez le fichier ``polls/templates/polls/results.html``, contenant ceci:

.. code-block:: django

  <h1>{{ poll.question }}</h1>

  <ul>
  {% for choice in poll.choice_set.all %}
      <li>{{ choice.choice_text }} -- {{ choice.votes }} vote{{ choice.votes|pluralize }}</li>
  {% endfor %}
  </ul>

  <a href="/polls/{{ poll.id }}/">Vote again?</a>

C'est tout ! Entrez l'adresse http://localhost:8000/admin/ et créez plusieurs nouveaux sondages et questions. 
Puis jouez en votant et invitez d'autres utilisateurs à faire de même.


.. admonition:: ``polls/views.py``
   :class: alert alert-hidden

   .. code-block:: python

        from django.http import HttpResponseRedirect
        from django.core.urlresolvers import reverse
        from django.shortcuts import get_object_or_404

        from polls.models import Choice
        from django.http import Http404
        from django.shortcuts import render
        from polls.models import Poll


        def index(request):
            latest_poll_list = Poll.objects.all().order_by('-pub_date')[:5]
            return render(
                request,
                'polls/index.html',
                {'latest_poll_list': latest_poll_list})


        def detail(request, poll_id):
            try:
                p = Poll.objects.get(id=poll_id)
            except Poll.DoesNotExist:
                raise Http404
            return render(request, 'polls/detail.html', {'poll': p})


        def results(request, poll_id):
            p = get_object_or_404(Poll, id=poll_id)
            return render(request, 'polls/results.html', {'poll': p})


        def vote(request, poll_id):
            p = get_object_or_404(Poll, id=poll_id)
            try:
                selected_choice = p.choice_set.get(id=request.POST['choice'])
            except (KeyError, Choice.DoesNotExist):
                # if user chooses a wrong option, show error
                return render(request, 'polls/detail.html', {
                    'poll': p,
                    'error_message': "You have to choose a correct option",
                })

            # Sauvegarde le nombre de votes
            selected_choice.votes += 1
            selected_choice.save()
            # Redirige l'utilisateur à la vue détaillée du sonage sur laquelle il/elle vient de voter
            return HttpResponseRedirect(reverse('polls.views.results', args=(p.id,)))

.. admonition:: ``urls.py``
   :class: alert alert-hidden

   .. code-block:: python

        from django.conf.urls import patterns, include, url

        from django.contrib import admin
        admin.autodiscover()

        urlpatterns = patterns('',
          url(r'^polls/$', 'polls.views.index'),
          url(r'^polls/(?P<poll_id>\d+)/$', 'polls.views.detail'),
          url(r'^polls/(?P<poll_id>\d+)/results/$', 'polls.views.results'),
          url(r'^polls/(?P<poll_id>\d+)/vote/$', 'polls.views.vote'),
          url(r'^admin/', include(admin.site.urls)),
        )

.. admonition:: ``polls/models.py``
   :class: alert alert-hidden

   .. code-block:: python

        from django.db import models

        class Poll(models.Model):
            question = models.CharField(max_length=200)
            pub_date = models.DateTimeField('date published')

            def __str__(self):
                return self.question


        class Choice(models.Model):
            poll = models.ForeignKey(Poll)
            choice_text = models.CharField(max_length=200)
            votes = models.IntegerField(default=0)

            def __str__(self):
                return self.choice_text
