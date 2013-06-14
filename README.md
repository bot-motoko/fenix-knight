# fenix-knight

[![Build Status](https://api.travis-ci.org/mrtaddy/fenix-knight.png?branch=master)](https://travis-ci.org/mrtaddy/fenix-knight)
[![Code Climate](https://codeclimate.com/github/mrtaddy/fenix-knight.png)](https://codeclimate.com/github/mrtaddy/fenix-knight)
[![Coverage Status](https://coveralls.io/repos/mrtaddy/fenix-knight/badge.png?branch=master)](https://coveralls.io/r/mrtaddy/fenix-knight)
[![Dependency Status](https://gemnasium.com/mrtaddy/fenix-knight.png)](https://gemnasium.com/mrtaddy/fenix-knight)

## Requirement

- Ruby 2.0
- Postgresql

## Setup

```
$ git clone git@github.com:mrtaddy/fenix-knight.git
$ bundle
$ cp config/database.yml.example config/database.yml
$ bundle exec rake db:create db:schema:load
$ spring rails s
#=> rackup!
```

## Test

```
$ spring rake
```
