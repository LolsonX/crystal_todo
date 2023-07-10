module Ui
  module Actionable
    alias ActionParam = Nil |
                        Bool |
                        Int64 |
                        Float64 |
                        String |
                        Symbol |
                        Array(ActionParam) |
                        Hash(String, ActionParam) |
                        Hash(Symbol, ActionParam)

    alias ActionResult = ActionParam

    alias Action = Proc(ActionParam, ActionParam, ActionResult)

    property action : Action
    private property context : Hash(String, ActionParam)

    def execute(*args)
      action.call(@context, *args)
    end

    def execute
      action.call(@context, nil)
    end

    def initialize(**kwargs, &action : ActionParam, ActionParam -> ActionResult)
      @action = action
      @context = Hash(String, ActionParam).new
    end

    private def setup_context(context)
      @context.merge!(context.to_h.transform_keys { |k| k.to_s })
    end
  end
end
