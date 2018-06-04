require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = create :applicant
    @job = create :job
    @application = create :application
    sign_in @applicant
  end

  test 'should be able to apply to job' do
    assert_difference 'Application.count', +1 do
      post apply_job_url @job
      assert_redirected_to @applicant.applications.last
    end
  end

  test 'should not be able to apply to same job twice' do
    assert_difference 'Application.count', +1 do
      2.times { post apply_job_url @job }
      assert_redirected_to @applicant.applications.last
    end
  end

  test 'should show all applications for an applicant' do
    get applications_path
    assert_response :success
  end

  test 'should show the status of an application for an applicant' do
    sign_in @application.applicant
    get application_path @application
    assert_response :success
  end
end
