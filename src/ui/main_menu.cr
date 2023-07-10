require "./menu"

module Ui
  class MainMenu < Menu
    def initialize
      super
    end

    def to_s : String
      entries.map { |e| "#{e.id}. #{e.description}" }.join("\n") + "\nEnter your choice: "
    end

    def inspect
      to_s
    end

    def get_action(id)
      @entries.find { |e| e.id == id } || :error
    end
  end
end
