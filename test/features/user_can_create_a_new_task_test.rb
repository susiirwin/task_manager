require_relative '../test_helper'

class UserCanCreateANewTaskTest < FeatureTest
  def test_it_creates_a_new_task
    visit '/'

    click_link("New Task")

    assert_equal "/tasks/new", current_path

    fill_in('task[title]', :with => 'This is a new Task')
    fill_in('task[description]', :with => 'This is a new description')

    save_and_open_page

    click_on('Submit')

    assert_equal "/tasks", current_path

    assert page.has_content?("This is a new Task")

    save_and_open_page
  end

end
