module Actions
  extend self

  def add_task(task_manager)
    print "Name: "
    task_manager.add_task(gets.to_s)
    :ok
  end

  def list_tasks(task_manager)
    puts "PRIORITY\t|NAME\t|COMPLTED|COMPLETION DATE"
    print task_manager.list_tasks.join("/n")
    STDIN.raw { STDIN.read_char }
    :ok
  end

  def complete_task(task_manager)
    print "#{task_manager.list_tasks.join("/n")}\nSelect task to complete: "
    choice = gets
    return :error if choice.nil? || !choice.to_i?

    task_manager.complete_task(choice.to_i - 1)
    :ok
  end

  def remove_task(task_manager)
    print "#{task_manager.list_tasks.join("/n")}\nSelect task to remove: "
    choice = gets
    return :error if choice.nil? || !choice.to_i?

    task_manager.remove_task(choice.to_i - 1)
    :ok
  end

  def save(task_manager)
    puts task_manager.to_json
    gets
  end
end
