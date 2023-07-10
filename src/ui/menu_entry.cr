require "./concerns/actionable"

module Ui
  class MenuEntry
    include Actionable

    property id
    property description

    def initialize(@id : Int32,
                   @description : String,
                   &block : ActionParam, ActionParam -> ActionResult)
      super(id: id, description: description, &block)
    end
  end
end
