# Important notice about this Gem

[ZeroPush has been acquired by Twitter](https://zeropush.com/acquisition) and will be shutting their doors on January 31, 2016.  They have partnered with [PushWoosh](http://www.pushwoosh.com) to provide a ["code free" migration path](http://docs.pushwoosh.com/docs/zeropush-migration).  This gem offers a bridge between the former ZeroPush API and mirror PushWoosh API.  Please note there have been only two minor changes:

1.  This gem and its files have been renamed from zero_push to zero_push_woosh to mark the bridge between the two providers
2.  The ZeroPush API endpoint URL has been replaced by the PushWoosh bridge API endpoint url (i.e. https://zeropush.pushwoosh.com)

Otherwise, all of the code remain the same as before.

## Installation

Add this line to your application's Gemfile:

    gem 'zero_push_woosh'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zero_push_woosh

## Usage

### Rails Generator
Generate the ZeroPushWoosh initializer if you are using Ruby on Rails.

    $ rails g zero_push_woosh:install

### API Client

The easiest way to use the API client is to set the server `auth_token` at the module level and call methods on the ZeroPushWoosh module. You can find the token on settings page for your app.

```ruby
  ZeroPushWoosh.auth_token = 'iosprod_your-server-token'
  ZeroPushWoosh.notify(device_tokens: ['abcdef'], alert: 'hello, world', badge: '+1', info: {user_id: 1234})
```

If your web application supports must support multiple mobile apps, you may configure it like this:

```ruby
  if Rails.env == 'development'  #or ENV['RACK_ENV']
    ZeroPushWoosh.auth_tokens = {
      apns: 'iosdev_XYZ',
      gcm: 'gcmdev_ABC',
    }
  else
    ZeroPushWoosh.auth_tokens = {
      apns: 'iosprod_XYZ',
      gcm: 'gcmprod_ABC',
    }
  end
```

You may then instantiate clients by calling the method that matches the auth token key:

```ruby
  ZeroPushWoosh.apns.broadcast( ... )
  ZeroPushWoosh.gcm.broadcast( ... )
```


Lastly, if you have many apps you may instantiate clients API Clients

```ruby
  client_1 = ZeroPushWoosh.client('iosprod_app-server-token-1')
  client_1.broadcast(alert: 'hello, app1')

  client_2 = ZeroPushWoosh.client('iosprod_app-server-token-2')
  client_1.broadcast(alert: 'hello, app2')
```

Methods supported by this gem and their parameters can be found in the [API Reference](https://zeropush.com/documentation/api_reference)

For more documentation, check our [Getting Started Guide with ZeroPushWoosh](https://zeropush.com/documentation)

## Contributing

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Write tests for your feature
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request
