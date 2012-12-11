Is It Open Coffee Tomorrow?
===========================

What is this?
-------------

A simple, embedded sinatra util-a-joke app to show when an Open Coffee event is
happening.

How?
----

To see a real usage visit https://github.com/ecoffey/isitbocctomorrow

The app assumes that the Open Coffee event happens every two weeks, but
lets you configure the seed date, hash tag, official site, and time
zone.

Deploy To Heroku
----------------

```
$ mkdir my-shiny-util-a-joke-app && cd my-shiny-util-a-joke-app
$ gem install heroku
$ heroku login
$ heroku create
$ echo -e "source :rubygems\n\ngem 'isitopencoffeetomorrow'"
$ bundle
$ git init
$ git add .
$ git commit -m 'Yay util-a-joke!'
$ git push heroku master
```
