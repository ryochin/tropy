Tropy on Rails
==============

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

> A simple Yuki's [Tropy](http://www.hyuki.com/d/200511.html#i20051103183338) clone built on vanilla [Ruby on Rails](https://rubyonrails.org/) 7.

Live Demo
----

https://tropy-app.herokuapp.com

Setup
-----

```sh
git clone --depth=1 https://github.com/ryochin/tropy.git
cd tropy/
```

### for development: running on local machine

```sh
bundle config set --local path vendor/bundle
bundle config set --local without production

bundle install
bin/rails db:migrate
bin/rails db:seed    # when first run
bin/rails s

open http://localhost:3000
```

The entries are to be stored at `db/development.sqlite3`.

### for production: running on Docker

```sh
docker-compose build
docker-compose up
docker-compose exec rails bin/rails db:migrate
docker-compose exec rails bin/rails db:seed    # when first run

open http://localhost:3000
```

License
-------

The MIT License
