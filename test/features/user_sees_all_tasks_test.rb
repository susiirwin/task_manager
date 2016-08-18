require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest
  def test_user_sees_all_tasks
    task_manager.create({title: "Title 1", description: "Description 1"})
    task_manager.create({title: "Title 2", description: "Description 2"})

    visit '/tasks'

    save_and_open_page

    assert page.has_content?("1: Title 1")
    assert page.has_content?("2: Title 2")
  end
end
