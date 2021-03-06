require 'net/http'

module Faast
  URL = 'https://www.appnotifications.com/account/notifications.json'
  
  class << self
    attr_accessor :user_credentials
  end

  class Notification
    attr_accessor :user_credentials
    attr_accessor :message
    attr_accessor :long_message
    attr_accessor :long_message_preview
    attr_accessor :title
    attr_accessor :subtitle
    attr_accessor :message_level
    attr_accessor :silent
    attr_accessor :action_loc_key
    attr_accessor :icon_url
    attr_accessor :sound

    simple_fields = [
      :message,
      :long_message,
      :long_message_preview,
      :title,
      :subtitle,
      :action_loc_key,
      :icon_url,
    ]

    def initialize
      @data = {}
      self.user_credentials = Faast.user_credentials
    end

    def user_credentials=(user_credentials)
      @user_credentials = user_credentials
      @data['user_credentials'] = user_credentials
    end

    def message_level=(message_level)
      self.class.assert_num_in_range(message_level, -2..2)
      @message_level = message_level
      @data['notification[message_level]'] = message_level
    end

    def silent=(silent)
      @silent = silent
      @data['notification[silent]'] = silent ? 1 : 0
    end

    def sound=(sound)
      self.class.assert_num_in_range(sound, 1..40)
      @sound = sound
      @data['notification[sound]'] = sound
    end

    def send
      uri = URI(URL)
      
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      
      req = Net::HTTP::Post.new(uri.to_s)
      req.set_form_data(@data)
      
      http.request(req)
    end

    def self.send
      if block_given?
        notif = self.new
        yield notif
        notif.send
      end
    end

    # create setters for simple fields
    simple_fields.each do |field|
      define_method("#{field}=") do |input|
        ivar = "@#{field}"
        url_param = "notification[#{field}]"
        instance_variable_set(ivar, input)
        @data[url_param] = input
      end
    end
    
    private

    def self.assert_num_in_range(num, range)
      unless range.include?(num)
        raise ArgumentError, "Expected number between #{range}"
      end
    end
  end
end
