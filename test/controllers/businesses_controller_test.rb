require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business = build :business
    sign_in @business
  end

  test 'should get root' do
    get businesses_root_url
    assert_response :success
  end
end
