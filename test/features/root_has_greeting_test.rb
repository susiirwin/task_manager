require_relative '../test_helper'

class GreetingPageTest < FeatureTest
  def test_greeting_displayed_properly
    visit '/'
    within('header') do
      assert page.has_content?("Welcome to Task Manager!")
    end
  end
end
