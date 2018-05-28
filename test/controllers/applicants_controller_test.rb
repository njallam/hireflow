require 'test_helper'

class ApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = build :applicant
    sign_in @applicant
  end

  test 'should get root' do
    get applicants_root_url
    assert_response :success
  end
end
