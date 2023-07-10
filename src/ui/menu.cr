require "./concerns/actionable"
require "./menu_entry"

module Ui
  class Menu
    property entries : Array(MenuEntry)

    def initialize
      @entries = Array(MenuEntry).new
    end

    def add_entry(entry : MenuEntry)
      entries << entry
    end

    def add_entries(*new_entries : MenuEntry)
      @entries |= new_entries.to_a
    end
  end
end
