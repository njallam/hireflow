require 'test_helper'

class Applicant::WelcomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = build :applicant
    sign_in @applicant
  end

  test 'should get root' do
    get applicant_root_url
    assert_response :success
  end
end
