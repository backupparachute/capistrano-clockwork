# Capistrano Clockwork

Capistrano plugin that integrates clockwork tasks into capistrano deployment script.

### Setup

Add the library to your `Gemfile`:

```ruby
gem 'capistrano-clockwork', :require => false
```

And load it into your deployment script `config/deploy.rb`:

```ruby
require 'capistrano-clockwork'
```

Add unicorn restart task hook:

```ruby
# Add clockwork hooks
after  "deploy:stop",    "clockwork:stop"
after  "deploy:start",   "clockwork:start"
before "deploy:restart", "clockwork:restart"
```
