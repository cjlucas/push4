[![Coverage Status](https://coveralls.io/repos/cjlucas/ruby-push4/badge.png)](https://coveralls.io/r/cjlucas/ruby-push4)
[![Build Status](https://travis-ci.org/cjlucas/ruby-push4.png?branch=master)](https://travis-ci.org/cjlucas/ruby-push4)

This is a simple library for the [Push 4.0](http://www.appnotifications.com/) API.

Currently only the REST API is supported.

---
## Synopsis ##

```ruby
require 'push4'

# user credentials can be set at the module level or directly in the Notification instance
Push4.user_credentials = push4_key

# create a notification instance
notification = Push4::Notification.new

notification.title    = 'This is the title'
notification.message  = 'This is the message'
notfication.icon_url  = 'https://github.com/favicon.ico'

notification.send
# => #<Net::HTTPOK 200 OK readbody=true>

# or use the block interface (this is prefered)
resp = Push4::Notification.send do |notification|
  notification.title    = 'This is the title'
  notification.message  = 'This is the message'
  notfication.icon_url  = 'https://github.com/favicon.ico'
end

resp
# => #<Net::HTTPOK 200 OK readbody=true>
