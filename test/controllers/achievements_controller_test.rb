require 'test_helper'

class AchievementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @achievement = create :achievement
    @applicant = create :applicant
  end

  # achievements#new
  test 'should allow making a new achievement as an applicant' do
    sign_in @applicant
    get new_applicant_profile_achievement_url
    assert_response :success
  end

  test 'should not allow making a new achievement when not signed in' do
    get new_applicant_profile_achievement_url
    assert_redirected_to new_applicant_session_path
  end

  # achievements#edit
  test 'should allow editing an achievement as an applicant' do
    sign_in @achievement.applicant
    get edit_applicant_profile_achievement_url @achievement
    assert_response :success
  end

  # achievements#create
  test 'should allow creating an achievement as an applicant' do
    sign_in @applicant
    assert_difference 'Achievement.count', +1 do
      post applicant_profile_achievements_url, params: {
        achievement: { date: @achievement.date,
                       description: @achievement.description,
                       title: @achievement.title }
      }
    end
    assert_redirected_to edit_applicant_profile_path
  end

  # achievements#update
  test 'should allow updating an achievement as an applicant' do
    sign_in @achievement.applicant
    patch applicant_profile_achievement_url @achievement, params: {
      achievement: { date: @achievement.date,
                     description: @achievement.description,
                     title: @achievement.title }
    }
    assert_redirected_to edit_applicant_profile_path
  end

  # achievements#delete
  test 'should allow deleting an achievement as an applicant' do
    sign_in @achievement.applicant
    assert_difference 'Achievement.count', -1 do
      delete applicant_profile_achievement_url @achievement
    end

    assert_redirected_to edit_applicant_profile_path
  end
end
