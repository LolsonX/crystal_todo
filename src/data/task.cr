module Data
  class Task
    property name : String
    property completed : Bool

    def initialize(@name : String, @completed : Bool = false)
    end

    def to_s : String
      "#{name} : #{completed ? "[x]" : "[ ]"}"
    end

    def format(index)
      "#{index}. #{to_s}"
    end
  end
end
