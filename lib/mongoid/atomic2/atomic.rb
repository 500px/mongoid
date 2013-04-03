module Atomic

  delegate :inc, to: :persistable_modifier

  def persistable_modifier
    AutoPersistModifier.new(Modifier.new(self))
  end

  def atomically
    mod = Modifier.new(self)
    yield(mod)
    mod.persist
  end
end
