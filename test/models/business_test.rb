require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  setup do
    @business = create :business
  end

  test 'should be valid' do
    assert @business.valid?
  end
end
