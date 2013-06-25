require 'test_helper'

require 'push4'

class TestPost < Test::Unit::TestCase
  def test_post_no_api_key
    resp = Push4::Notification.send { |notification| }
    assert_block { resp.is_a?(Net::HTTPUnauthorized) }
  end

  def test_post_with_api_key
    user_credentials_file = File.expand_path('../user_creds.txt', __FILE__)
    p user_credentials_file
    if File.exists?(user_credentials_file)
      resp = Push4::Notification.send do |notification|
        notification.user_credentials = File.read(user_credentials_file).strip
        notification.title = 'this is the title'
        notification.message = 'this is the message'
      end

      assert_block { resp.is_a?(Net::HTTPOK) }
    end
  end
end
