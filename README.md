Tropy on Rails
==============

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

> A simple Yuki's [Tropy](http://www.hyuki.com/d/200511.html#i20051103183338) clone built on vanilla [Ruby on Rails](https://rubyonrails.org/) 6.

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
bundle install --path vendor/bundle --without production
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s

open http://localhost:3000
```

The entries are to be stored at `db/development.sqlite3`.

### for production: running on Docker

```sh
docker build -t tropy .
docker run -d --rm -p 3000:3000 -v $PWD/db:/app/db --name tropy tropy
docker exec -it tropy bundle exec rails db:migrate
docker exec -it tropy bundle exec rails db:seed    # when first run

open http://localhost:3000
```

License
-------

The MIT License
