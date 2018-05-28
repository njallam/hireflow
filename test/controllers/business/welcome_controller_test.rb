require 'test_helper'

class Business::WelcomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business = build :business
    sign_in @business
  end

  test 'should get root' do
    get business_root_url
    assert_response :success
  end
end
