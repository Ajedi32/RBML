require "forwardable"

module RBML
  class FragmentContents
    include Enumerable
    extend Forwardable

    def_delegators :@contents, :[], :[]=, :each, :empty?

    def initialize(contents=[])
      @contents = contents.to_a
    end

    def <<(item)
      item = Text.new(item) if item.is_a? String
      @contents << item
    end

    def to_a
      @contents.dup
    end

    def inspect
      @contents.inspect + ":" + self.class.name
    end
  end
end
