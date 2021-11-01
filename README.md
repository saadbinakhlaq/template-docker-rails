# README

## Installation
```
$ docker-compose build
$ docker-compose up
```
#### Create database
```
$ docker-compose run app_name_app bundle exec rake db:create
$ docker-compose run app_name_app bundle exec rake db:schema:load
```

#### Load seeds
```
$ docker-compose run app_name_app bundle exec rake db:seed
```