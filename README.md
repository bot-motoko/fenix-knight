# fenix-knight

[![Build Status](https://api.travis-ci.org/mrtaddy/fenix-knight.png?branch=master)](https://travis-ci.org/mrtaddy/fenix-knight)
[![Code Climate](https://codeclimate.com/github/mrtaddy/fenix-knight.png)](https://codeclimate.com/github/mrtaddy/fenix-knight)
[![Coverage Status](https://coveralls.io/repos/mrtaddy/fenix-knight/badge.png?branch=master)](https://coveralls.io/r/mrtaddy/fenix-knight)
[![Dependency Status](https://gemnasium.com/mrtaddy/fenix-knight.png)](https://gemnasium.com/mrtaddy/fenix-knight)

## Requirement

- Ruby 2.0
- Node.js
- Postgresql
- ([qnyp/heroku-buildpack-ruby-bower](http://blog.qnyp.com/2013/05/30/say-hello-to-bower/))

## Setup

```
$ git clone git@github.com:mrtaddy/fenix-knight.git
$ cd fenix-knight
$ bundle
$ bower install
$ cp config/database.yml.example config/database.yml
$ cp .env.example .env
$ spring rake db:create db:schema:load
$ spring rails s
#=> rackup!
```

## Test

```
$ spring rake spec
```

## Heroku

```
$ heroku config:set \
  BUILDPACK_URL='git://github.com/qnyp/heroku-buildpack-ruby-bower.git#run-bower' \
  USER_TAGGABLE=user \
  PASSWORD_TAGGABLE=password
```
