require 'test_helper'

class AppliantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = create :applicant
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
    patch applicant_profile_url, params: { applicant: { first_name: new_first_name,
                                                        last_name: new_last_name } }
    @applicant.reload
    assert_equal new_first_name, @applicant.first_name
    assert_equal new_last_name, @applicant.last_name
    assert_redirected_to edit_applicant_profile_path
  end

  test 'should not allow editing applicant profile if not signed in' do
    get edit_applicant_profile_url
    assert_redirected_to new_applicant_session_path
  end

  test 'should not allow update applicant profile if not signed in' do
    patch applicant_profile_url
    assert_redirected_to new_applicant_session_path
  end
end
