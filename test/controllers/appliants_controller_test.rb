require 'test_helper'

class AppliantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = build :applicant
  end

  test 'should allow editing applicant profile' do
    sign_in @applicant
    get edit_applicant_profile_url
    assert_response :success
  end

  test 'should allow updating applicant profile' do
    sign_in @applicant
    new_first_name = Faker::Name.first_name
    new_last_name = Faker::Name.last_name
    patch applicant_profile_url, params: { applicant: { first_name: new_first_name, last_name: new_last_name } }
    assert_equal @applicant.first_name, new_first_name
    assert_equal @applicant.last_name, new_last_name
    assert_redirected_to edit_applicant_profile_path
  end
end
