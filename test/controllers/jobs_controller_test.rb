require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business = create :business
    @job = create :job, business: @business
  end

  test 'should allow viewing all jobs' do
    get jobs_url
    assert_response :success
  end

  test 'should allow viewing a job' do
    get job_url @job
    assert_response :success
  end

  test 'should allow making a new job' do
    sign_in @business
    get new_job_url
    assert_response :success
  end

  # test 'should allow creating a job' do
  #   # TODO
  # end
  #
  # test 'should allow deleting a job' do
  #   # TODO
  # end

  test 'should allow editing a job' do
    sign_in @business
    get edit_job_url @job
    assert_response :success
  end

  test 'should allow updating a job' do
    sign_in @business
    new_position = Faker::Job.title
    new_description = Faker::Lorem.paragraph
    patch job_url @job, params: { job: { position: new_position,
                                         description: new_description } }
    @job = Job.find @job.id
    assert_equal new_position, @job.position
    assert_equal new_description, @job.description
    assert_redirected_to job_path @job
  end
end
