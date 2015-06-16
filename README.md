# APNs with pemfile on AWS S3

[![Gem Version](https://badge.fury.io/rb/apns-s3.svg)](http://badge.fury.io/rb/apns-s3)
[![Dependency Status](https://gemnasium.com/kaosf/apns-s3.svg)](https://gemnasium.com/kaosf/apns-s3)

Download PEM file from AWS S3 and set it to `APNS` module.

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

### CAUTION from version 0.2

You **MUST** speciry `region` e.g. `us-east-1` or `ap-northeast-1`.

All regions are listed [here](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html).

```ruby
require 'apns-s3'

ApnsS3.set_pemfile(
  region: 'us-east-1',
  aws_access_key_id: 'your-access-key-id',
  aws_secret_access_key: 'your-secret-access-key',
  bucketname: 'bucketname-including-PEM-file',
  filename: 'PEM-filename'
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
File.delete 'PEM-filename' if File.exist? 'PEM-filename'
```

For `APNS` module's further information, refer
[jpoz/APNS](https://github.com/jpoz/APNS).

## Contributing

1. Fork it ( https://github.com/kaosf/apns-s3/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
