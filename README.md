# Blorgh
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'blorgh'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install blorgh
```

## Getting started
After the installation we need to setup the action cable to the project.

Run the following command:

```bash
bin/rails g blorgh:config
```

This command will add 2 new files `blorgh_channel.rb` and `blorgh_channel.js` these files will be responsible to adding the correct configuration.

Now paste the following code on your `application_controller.rb` to be able to use the `all_exceptions` feature:

```ruby
rescue_from Exception, with: ->(e) { Blorgh::Logger.handle_exception(e) }
```

#### Gem configuration initializers
You can also define configurations by creating a file `blorgh.rb` on `config/initializers` and use it like the following:

```ruby
Blorgh.configure.channel = 'my_channel_name'
Blorgh.configure.persist = true
Blorgh.configure.all_exceptions = true
```

or

```ruby
Blorgh.configure do |config|
    config.channel = 'my_channel_name'
    config.persist = true
    config.all_exceptions = true
end
```


| Name  |  Type | Default  | Description  |
|---|---|---|---|
|channel|string|"blorgh_channel"|It setups the name of the streaming room|
|persist|boolean|false|It enables the persistance of data|
|all_exceptions|boolean|false|It enables to send all exceptions|





## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
