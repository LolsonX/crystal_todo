require "./data/*"

task_manager = Data::TaskManager.new
main_menu = [
  "1. Add task",
  "2. Complete task",
  "3. List tasks",
  "4. Remove task",
  "5. Exit",
  "Enter your choice: ",
].join("\n")
loop do
  print(main_menu)
  choice = gets()
  next unless choice

  puts "\e[2J\e[f"
  case choice.to_i
  when 1
    puts "Enter name of task:"
    name = gets
    if name
      task_manager.add_task(name: name.chomp)
    end
  when 2
    puts "Which task You want to complete?"
    puts task_manager.list_tasks.join("\n")
    choice = gets
    if choice && choice.to_i?
      task_manager.complete_task(choice.to_i - 1)
    end
  when 3
    puts task_manager.list_tasks.join("\n")
    gets
  when 4
    puts "Which task You want to remove?"
    choice = gets
    if choice && choice.to_i?
      task_manager.remove_task(choice.to_i - 1)
    end
  when 5
    break
  else
    puts "Invalid choice!"
  end
end
