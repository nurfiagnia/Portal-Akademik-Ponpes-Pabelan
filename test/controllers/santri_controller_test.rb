require 'test_helper'

class SantriControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get santri_index_url
    assert_response :success
  end

end
