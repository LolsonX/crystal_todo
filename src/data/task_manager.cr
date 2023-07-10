require "./task"

module Data
  class TaskManager
    property tasks : Array(Task)

    def initialize
      @tasks = [] of Task
    end

    def add_task(name : String)
      @tasks << Task.new(name: name)
    end

    def remove_task(index)
      if index >= 0 && index < tasks.size
        tasks.delete_at(index)
      end
    end

    def complete_task(index : Int32) : Task | Bool
      if index >= 0 && index < tasks.size
        tasks[index].completed = true
      else
        false
      end
    end

    def list_tasks
      tasks.map_with_index do |task, index|
        task.format(index + 1)
      end
    end
  end
end
