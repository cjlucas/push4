require 'test_helper'

require 'faast'

class TestPost < Test::Unit::TestCase
  def test_post_no_api_key
    resp = Faast::Notification.send { |notification| }
    assert_block { resp.is_a?(Net::HTTPUnauthorized) }
  end

  def test_post_with_api_key
    user_credentials_file = File.expand_path('../user_creds.txt', __FILE__)
    
    if File.exists?(user_credentials_file)
      resp = Faast::Notification.send do |notification|
        notification.user_credentials = File.read(user_credentials_file).strip
        notification.title = '[ruby-faast] this is the title'
        notification.message = '[ruby-faast] this is the message'
      end

      assert_block { resp.is_a?(Net::HTTPSuccess) }
    end
  end
end
