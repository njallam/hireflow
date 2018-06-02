require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business = create :business
  end

  test 'should allow editing business profile' do
    sign_in @business
    get edit_business_profile_url
    assert_response :success
  end

  test 'should allow updating business profile' do
    sign_in @business
    new_name = Faker::Company.name
    patch business_profile_url, params: { business: { name: new_name } }
    assert_equal @business.name, new_name
    assert_redirected_to edit_business_profile_path
  end
end
