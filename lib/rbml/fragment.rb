require "rbml/fragment_contents"

module RBML
  class Fragment
    include RBML::DSL

    def initialize(&body)
      instance_eval(&body) if body
    end

    def to_html(*args)
      contents.map{|fragment| fragment.to_html(*args)}.join("\n")
    end

    def contents
      @contents ||= FragmentContents.new
    end

    def c
      contents
    end
  end
end
