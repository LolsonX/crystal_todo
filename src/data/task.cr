require "json"

module Data
  class Task
    enum Priority
      Low
      Normal
      High
    end

    include Comparable(Task)
    include JSON::Serializable

    @[JSON::Field(key: "name")]
    property name : String
    @[JSON::Field(key: "completed")]
    property completed : Bool
    @[JSON::Field(key: "priority")]
    property priority : Priority
    @[JSON::Field(key: "completed_at")]
    property completed_at : Time?

    def initialize(@name : String, @completed = false, @priority = Priority::Normal)
    end

    def to_s : String
      "[#{priority.to_s}]\t|#{name}:\t|#{completed ? "[x]\t|#{completed_at}" : "[ ]\t|"}"
    end

    def format(index)
      "#{index}. #{to_s}"
    end

    def complete
      self.completed = true
      self.completed_at = Time.local
      self
    end

    def <=>(other : Task)
      self.priority <=> other.priority
    end
  end
end
