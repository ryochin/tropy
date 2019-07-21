Tropy on Rails
==============

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

> A simple [Tropy](http://www.hyuki.com/d/200511.html#i20051103183338) clone built on Rails 5.

Setup
-----

```sh
git clone --depth=1 https://github.com/ryochin/tropy.git
cd tropy/

bundle install --path vendor/bundle --without production
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s

open http://localhost:3000
```

Demo
----

https://tropy-app.herokuapp.com
