require "rbml/fragment_contents"

module RBML
  class Fragment
    include RBML::DSL

    def initialize(&body)
      instance_eval(&body) if body
    end

    def render(*args)
      contents.map{|fragment| fragment.render(*args)}.join("\n")
    end

    def contents
      @contents ||= FragmentContents.new
    end
  end
end
