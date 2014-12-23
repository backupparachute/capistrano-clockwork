# Capistrano::Clockwork

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-clockwork', :git => 'git://github.com/backupparachute/capistrano-clockwork.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-clockwork

## Usage

load it into your deployment script `config/deploy.rb`:

```ruby
require 'capistrano/clockwork'
```

Add clockwork task hooks:

```ruby
# Add clockwork hooks
after  "deploy:stop",    "clockwork:stop"
after  "deploy:start",   "clockwork:start"
before "deploy:restart", "clockwork:restart"
```
