require 'test/unit'

require 'push4'

class TestPost < Test::Unit::TestCase
  def test_post_no_api_key
    resp = Push4::Notification.send { |notification| }
    assert_block { resp.is_a?(Net::HTTPUnauthorized) }
  end
end
