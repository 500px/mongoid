module Atomic
  class AutoPersistModifier < Decorator

    def inc(*args)
      @component.inc(args).persist
    end
  end
end
