# Apns::S3

Download PEM file from AWS S3 and set APNS module.

This feature is useful on Heroku.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apns-s3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apns-s3

## Usage

```ruby
require 'apns-s3'

ApnsS3.set_pemfile(
  aws_access_key_id: 'your-access-key-id',
  aws_secret_access_key: 'your-secret-access-key',
  bucketname: 'bucketname including PEM file',
  filename: 'PEM filename'
)
```

After that, you can send notifications normally.

```ruby
APNS.host = 'gateway.push.apple.com' # if not sandbox
APNS.send_notification(
  'your device token'
  alert: 'alert message',
  badge: 1,
  sound: 'default'
)

# If you want to delete PEM file
File.delete filename if File.exist? filename
```

For `APNS` module's further information, refer
[jpoz/APNS](https://github.com/jpoz/APNS).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/apns-s3/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
