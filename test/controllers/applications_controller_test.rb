require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = create :applicant
    @business = create :business
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
    sign_in @business
    get applications_path
    assert_response :success
  end

  test 'should noy show applications if not signed in' do
    get applications_path
    assert_redirected_to root_path
  end

  # applications#create
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
    sign_in @business
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

  test 'should not be able to confirm an application that isnt yours' do
    sign_in @applicant
    patch confirm_application_path @application
    assert_redirected_to applications_path
  end

  test 'should not be able to confirm an application as a business' do
    sign_in @application.job.business
    patch confirm_application_path @application
    assert_redirected_to new_applicant_session_path
  end

  test 'should not be able to confirm an application if you arent signed in' do
    patch confirm_application_path @application
    assert_redirected_to new_applicant_session_path
  end

  # applications#update
  test 'should be able to update an application to have a cover letter as an applicant' do
    sign_in @application.applicant
    cover_letter = Faker::Lorem.paragraph
    patch confirm_application_path @application
    patch application_path @application, params: { application: { cover_letter: cover_letter } }
    @application.reload
    assert_redirected_to application_path @application
    assert_equal cover_letter, @application.cover_letter
  end

  # TODO: other types of updating, for applicants and businesses

  test 'should not be able to update an application that isnt yours as an applicant' do
    sign_in @applicant
    patch application_path @application
    assert_redirected_to applications_path
  end

  test 'should not be able to update an application that isnt yours as a business' do
    sign_in @business
    patch application_path @application
    assert_redirected_to jobs_path
  end

  test 'should not be able to update an application if not signed in' do
    patch application_path @application
    assert_redirected_to root_path
  end

  # applications#accept
  test 'should be able to accept an applicants screening as a business' do
    application = create :application, aasm_state: 'screening'
    sign_in application.job.business
    patch accept_application_path application
    application.reload
    assert application.interview?
    assert_redirected_to application_path application
  end

  test 'should be able to accept an applicants interview as a business' do
    application = create :application, aasm_state: 'interview'
    sign_in application.job.business
    patch accept_application_path application
    application.reload
    assert application.accepted?
    assert_redirected_to application_path application
  end

  test 'should not be able to accept an application if the job doesnt belong to you' do
    sign_in @business
    patch accept_application_path @application
    assert_redirected_to jobs_path
  end

  test 'should not be able to accept an application if signed in as an applicant' do
    sign_in @application.applicant
    patch accept_application_path @application
    assert_redirected_to new_business_session_path
  end

  test 'should not be able to accept an application if not signed in' do
    patch accept_application_path @application
    assert_redirected_to new_business_session_path
  end

  # applications#reject
  test 'should be able to reject an applicants screening as a business' do
    application = create :application, aasm_state: 'screening'
    sign_in application.job.business
    patch reject_application_path application
    application.reload
    assert application.screening?
    assert application.rejected?
    assert_redirected_to application_path application
  end

  test 'should be able to reject an applicants interview as a business' do
    application = create :application, aasm_state: 'interview'
    sign_in application.job.business
    patch reject_application_path application
    application.reload
    assert application.interview?
    assert application.rejected?
    assert_redirected_to application_path application
  end

  test 'should not be able to reject an application if the job doesnt belong to you' do
    sign_in @business
    patch reject_application_path @application
    assert_redirected_to jobs_path
  end

  test 'should not be able to reject an application if signed in as an applicant' do
    sign_in @application.applicant
    patch reject_application_path @application
    assert_redirected_to new_business_session_path
  end

  test 'should not be able to reject an application if not signed in' do
    patch reject_application_path @application
    assert_redirected_to new_business_session_path
  end

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
    sign_in @applicant
    get application_path @application
    assert_redirected_to applications_path
  end

  test 'should not show the status of an application that isnt yours as a business' do
    sign_in @business
    get application_path @application
    assert_redirected_to jobs_path
  end

  test 'should now show the status of an application if not signed in' do
    get application_path @application
    assert_redirected_to root_path
  end
end
