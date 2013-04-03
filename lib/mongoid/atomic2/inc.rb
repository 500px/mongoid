module Atomic
  module Inc

    def inc(field, value)
      op = IncOperation.new(field, value)
      self.add_operation(op)
    end
  end
end
