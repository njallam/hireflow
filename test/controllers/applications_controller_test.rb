require 'test_helper'

class ApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @applicant = create :applicant
    @job = create :job
    sign_in @applicant
  end

  test 'should be able to apply to job' do
    assert_difference 'Application.count', +1 do
      post apply_job_url(@job)
    end
  end

  test 'should not be able to apply to same job twice' do
    assert_difference 'Application.count', +1 do
      2.times { post apply_job_url(@job) }
    end
  end
end
