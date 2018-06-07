require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business = create :business
    @job = create :job
  end

  # jobs#index
  test 'should allow viewing all jobs' do
    get jobs_url
    assert_response :success
  end

  # jobs#show
  test 'should allow viewing a job' do
    get job_url @job
    assert_response :success
  end

  # jobs#new
  test 'should allow making a new job' do
    sign_in @job.business
    get new_job_url
    assert_response :success
  end

  # jobs#create
  test 'should allow creating a job as a business' do
    sign_in @business
    assert_difference 'Job.count', +1 do
      post jobs_path, params: { job: { position: 'dev', description: 'make all the codes',
                                       business: @business } }
      assert_redirected_to @business.jobs.last
    end
  end

  test 'should now allow creating a job if not signed in' do
    post jobs_path
    assert_redirected_to new_business_session_path
  end

  test 'should not allow creating a job if signed in as an applicant' do
    post jobs_path
    assert_redirected_to new_business_session_path
  end

  # jobs#update
  test 'should allow updating a job' do
    sign_in @job.business
    new_position = Faker::Job.title
    new_description = Faker::Lorem.paragraph
    patch job_url @job, params: { job: { position: new_position,
                                         description: new_description } }
    @job.reload
    assert_equal new_position, @job.position
    assert_equal new_description, @job.description
    assert_redirected_to job_path @job
  end

  # jobs#destroy
  test 'should allow deleting a job as the business which ownes it' do
    sign_in @job.business
    assert_difference 'Job.count', -1 do
      delete job_path @job
      assert_redirected_to jobs_path
    end
  end

  test 'should not allow deleting a job as a business which doesnt own it' do
    sign_in @business
    assert_no_difference 'Job.count' do
      delete job_path @job
      assert_redirected_to jobs_path
    end
  end

  test 'should not allow deleting a job if not signed in' do
    assert_no_difference 'Job.count' do
      delete job_path @job
      assert_redirected_to new_business_session_path
    end
  end

  test 'should not allow deleting a job if signed in as an applicant' do
    assert_no_difference 'Job.count' do
      delete job_path @job
      assert_redirected_to new_business_session_path
    end
  end

  # jobs#edit
  test 'should allow editing a job' do
    sign_in @job.business
    get edit_job_url @job
    assert_response :success
  end
end
