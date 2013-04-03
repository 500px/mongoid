module Atomic
  class Operations

    def initialize(field, value)
      @field, @value = field, value
    end

    def command
      ## TODO
    end

    def execute
      ## TODO
    end

    def hash_value
      { @field => @value }
    end
  end

  class IncOperation < Operations
    def command
      {'$inc' => hash_value}
    end
  end


end
