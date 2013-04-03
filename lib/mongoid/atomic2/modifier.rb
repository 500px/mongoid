module Atomic
  class Modifier
    attr_accessor :operations

    include Inc

    def initialize(document)
      @operations = []
    end

    def persist
      mod_hash = {}
      @operations.each do |opt|
        mod_hash.merge!(opt.command)
      end

      collection.find(selector).update(positionally(selector, mod_hash))

      @operations.each do |opt|
        opt.execute
      end
    end


    def add_operation(op)
      @operations << op
    end

    private

    def collection
      document.collection
    end

  end
end
