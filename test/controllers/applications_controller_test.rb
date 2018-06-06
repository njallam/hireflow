require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = create :applicant
    @job = create :job
    @application = create :application
  end

  # applications#index
  test 'should show all applications as an applicant' do
    sign_in @applicant
    get applications_path
    assert_response :success
  end

  test 'should show all the applications as a business' do
    sign_in create :business
    get applications_path
    assert_response :success
  end

  test 'should noy show applications if not signed in' do
    get applications_path
    assert_redirected_to root_path
  end

  # appplications#create
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

  test 'should not be able to apply to a job if signed in as a business' do
    sign_in create :business
    assert_no_difference 'Application.count' do
      post apply_job_url @job
      assert_redirected_to new_applicant_session_path
    end
  end

  test 'should not be able to apply to a job if not signed in' do
    assert_no_difference 'Application.count' do
      post apply_job_url @job
      assert_redirected_to new_applicant_session_path
    end
  end

  # applications#confirm
  test 'should be able to confirm an application as an applicant' do
    sign_in @application.applicant
    patch confirm_application_path @application
    @application.reload
    assert_redirected_to application_path @application
    assert @application.cover?
  end

  # TODO: can you confirm an application as a business?

  # applications#update
  test 'should be able to update an application to have a cover letter as an applicant' do
    sign_in @application.applicant
    cover_letter = 'This is a cover letter'
    patch confirm_application_path @application
    patch application_path @application, params: { application:
                                                 { cover_letter: cover_letter } }
    @application.reload
    assert_equal cover_letter, @application.cover_letter
  end

  # TODO: other types of updating, for applicants and businesses

  test 'should not be able to update an application that isnt yours as an applicant' do
    sign_in create :applicant
    patch application_path @application
    assert_redirected_to applications_path
  end

  test 'should not be able to update an application that isnt yours as a business' do
    sign_in create :business
    patch application_path @application
    assert_redirected_to jobs_path
  end

  test 'should not be able to update an application if not signed in' do
    patch application_path @application
    assert_redirected_to root_path
  end

  # TODO: applications#accept

  # TODO: applications#reject

  # applications#show
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

  test 'should not show the status of an application that isnt yours as an applicant' do
    sign_in create :applicant
    get application_path @application
    assert_redirected_to applications_path
  end

  test 'should not show the status of an application that isnt yours as a business' do
    sign_in create :business
    get application_path @application
    assert_redirected_to jobs_path
  end

  test 'should now show the status of an application if not signed in' do
    get application_path @application
    assert_redirected_to root_path
  end
end
