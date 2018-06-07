require 'test_helper'

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @experience = create :experience
    @applicant = create :applicant
  end

  # experiences#new
  test 'should allow making a new experience as an applicant' do
    sign_in @applicant
    get new_applicant_profile_experience_url
    assert_response :success
  end

  test 'should not allow making a new experience when not signed in' do
    get new_applicant_profile_experience_url
    assert_redirected_to new_applicant_session_path
  end

  # experiences#edit
  test 'should allow editing an experience as an applicant' do
    sign_in @experience.applicant
    get edit_applicant_profile_experience_url @experience
    assert_response :success
  end

  # experiences#create
  test 'should allow creating an experience as an applicant' do
    sign_in @applicant
    assert_difference 'Experience.count', +1 do
      post applicant_profile_experiences_url, params: {
        experience: { end_date: @experience.end_date,
                      start_date: @experience.start_date,
                      description: @experience.description,
                      title: @experience.title,
                      place: @experience.place }
      }
    end
    assert_redirected_to edit_applicant_profile_path
  end

  # experiences#update
  test 'should allow updating an experience as an applicant' do
    sign_in @experience.applicant
    patch applicant_profile_experience_url @experience, params: {
      experience: { end_date: @experience.end_date,
                    start_date: @experience.start_date,
                    description: @experience.description,
                    title: @experience.title,
                    place: @experience.place }
    }
    assert_redirected_to edit_applicant_profile_path
  end

  # experiences#delete
  test 'should allow deleting an experience as an applicant' do
    sign_in @experience.applicant
    assert_difference 'Experience.count', -1 do
      delete applicant_profile_experience_url @experience
    end

    assert_redirected_to edit_applicant_profile_path
  end
end
