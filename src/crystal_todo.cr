require "./data/*"
require "./ui/main_menu"
require "./actions"

task_manager = Data::TaskManager.new
main_menu = Ui::MainMenu.new
main_menu.add_entry(
  Ui::MenuEntry.new(id: 1, description: "Add task") { Actions.add_task(task_manager) }
)
main_menu.add_entry(
  Ui::MenuEntry.new(id: 2, description: "List tasks") { Actions.list_tasks(task_manager) }
)
main_menu.add_entry(
  Ui::MenuEntry.new(id: 3, description: "Complete task") { Actions.complete_task(task_manager) }
)
main_menu.add_entry(
  Ui::MenuEntry.new(id: 4, description: "Remove task") { Actions.remove_task(task_manager) }
)
main_menu.add_entry(
  Ui::MenuEntry.new(id: 5, description: "Exit") { :exit }
)
main_menu.add_entry(
  Ui::MenuEntry.new(id: 6, description: "Save") { Actions.save(task_manager) }
)
clear_screen

loop do
  clear_screen
  print(main_menu.to_s)
  choice = gets()
  next unless choice

  case choice.to_i
  when 1, 2, 3, 4, 5, 6
    action = main_menu.get_action(choice.to_i)
    result = if action == :error
               next
             elsif action.responds_to?(:execute)
               action.execute
             end
    if result == :exit
      break
    end
  else
    puts "Invalid choice!"
  end
end

def clear_screen
  print "\e[2J\e[f"
end
