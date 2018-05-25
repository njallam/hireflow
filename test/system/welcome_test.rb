require 'application_system_test_case'

class WelcomeTest < ApplicationSystemTestCase
  test 'loading the home page' do
    # Visit the home page
    visit root_url

    # Verify that page loaded correctly
    assert_selector '.navbar-brand', text: 'HireFlow'
  end
end
