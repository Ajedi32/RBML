module RBML
  class Text
    def initialize(content)
      @content = content
    end

    def to_html(indent = 0)
      @content.gsub("\n", "\n#{"\t"*indent}")
    end
  end
end
