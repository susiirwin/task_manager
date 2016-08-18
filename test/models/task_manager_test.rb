require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def current_task_id
    task_manager.all.last.id
  end

  def create_a_task
    task_manager.create({
      :title => "some title",
      :description => "this is the description"
      })
  end

  def number_of_tasks
    task_manager.all.count
  end

  def test_it_creates_a_task
    create_a_task

    task = task_manager.find(current_task_id)
    assert_equal "some title", task.title
    assert_equal current_task_id, task.id
    assert_equal "this is the description", task.description
  end

  def test_it_returns_all_tasks
    create_a_task
    create_a_task

    assert_equal 2, number_of_tasks
    assert_instance_of Task, task_manager.all.last
  end

  def test_it_can_find_a_task
    create_a_task

    task = task_manager.find(current_task_id)

    assert_instance_of(Task, task)

  end

  def test_it_can_delete_a_task
    create_a_task
    assert_equal(1, number_of_tasks)
    task_manager.destroy(current_task_id)
    assert_equal(0, number_of_tasks)
  end

  def test_it_can_update_a_task
    create_a_task
    params = {task: {title: "some new title", description: "a new descrip"}}
    task_manager.update(current_task_id, params[:task])

    task = task_manager.find(current_task_id)
    assert_equal("some new title", task.title)
    assert_equal("a new descrip", task. description)
  end
end
