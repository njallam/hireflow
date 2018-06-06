require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = create :applicant
    @job = create :job
    @application = create :application
  end

  test 'should be able to apply to job as an applicant' do
    sign_in @applicant
    assert_difference 'Application.count', +1 do
      post apply_job_url @job
      assert_redirected_to @applicant.applications.last
    end
  end

  test 'should not be able to apply to same job twice as an applicant' do
    sign_in @applicant
    assert_difference 'Application.count', +1 do
      2.times { post apply_job_url @job }
      assert_redirected_to @applicant.applications.last
    end
  end

  test 'should show all applications as an applicant' do
    sign_in @applicant
    get applications_path
    assert_response :success
  end

  test 'should show the status of an application as an applicant' do
    sign_in @application.applicant
    get application_path @application
    assert_response :success
  end

  test 'should show the status of an application as a business' do
    sign_in @application.job.business
    get application_path @application
    assert_response :success
  end

  test 'should now show the status of an application if not signed in' do
    get application_path @application
    assert_redirected_to root_path
  end

  test 'should not be able to apply to a job if not signed in' do
    assert_no_difference 'Application.count' do
      post apply_job_url @job
      assert_redirected_to new_applicant_session_path
    end
  end

  test 'should not be able to apply to a job if signed in as a business' do
    sign_in create :business
    assert_no_difference 'Application.count' do
      post apply_job_url @job
      assert_redirected_to new_applicant_session_path
    end
  end
end
