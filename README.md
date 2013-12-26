[![Coverage Status](https://coveralls.io/repos/cjlucas/ruby-faast/badge.png)](https://coveralls.io/r/cjlucas/ruby-faast)
[![Build Status](https://travis-ci.org/cjlucas/ruby-faast.png?branch=master)](https://travis-ci.org/cjlucas/ruby-faast)

This is a simple library for the [Faast](http://www.faast.io/) push notification service.

Currently only the REST API is supported.

---
## Synopsis ##

```ruby
require 'faast'

# user credentials can be set at the module level or directly in the Notification instance
Faast.user_credentials = 'api_key'

# create a notification instance
notification = Faast::Notification.new

notification.title    = 'This is the title'
notification.message  = 'This is the message'
notfication.icon_url  = 'https://github.com/favicon.ico'

notification.send
# => #<Net::HTTPOK 200 OK readbody=true>

# or use the block interface (this is prefered)
resp = Faast::Notification.send do |notification|
  notification.title    = 'This is the title'
  notification.message  = 'This is the message'
  notfication.icon_url  = 'https://github.com/favicon.ico'
end

resp
# => #<Net::HTTPOK 200 OK readbody=true>
