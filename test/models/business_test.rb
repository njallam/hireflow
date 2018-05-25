require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  setup do
    @business = create :business
  end

  test 'should be valid' do
    assert @business.valid?
  end

  test 'should validate presence of name' do
    other_business = Business.create bio: ''
    assert other_business.invalid?
  end

  test 'should allow empty bio' do
    other_business = Business.create name: 'Name'
    assert other_business.valid?
  end

  test 'should enforce uniqueness of names' do
    other_business = Business.create
    assert other_business.invalid?
  end
end
