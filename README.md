Tropy on Rails
==============

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

> A simple [Tropy](http://www.hyuki.com/d/200511.html#i20051103183338) clone built on Rails 5.

Setup
-----

```sh
git clone --depth=1 https://github.com/ryochin/tropy.git
cd tropy/
```

### for local run

```sh
bundle install --path vendor/bundle --without production
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s

open http://localhost:3000
```

### using Docker

```sh
docker build -t tropy .
docker run -d --rm -p 3000:3000 -v $PWD/db:/app/db --name tropy tropy
docker exec -it tropy bundle exec rails db:migrate
docker exec -it tropy bundle exec rails db:seed

open http://localhost:3000
```

Demo
----

https://tropy-app.herokuapp.com
