require 'test_helper'

class RecruiterTest < ActiveSupport::TestCase
  setup do
    @recruiter = create :recruiter
  end

  test 'should be valid' do
    assert @recruiter.valid?
  end

  test 'should not be in a business upon creation' do
    assert_nil @recruiter.business
  end
end
