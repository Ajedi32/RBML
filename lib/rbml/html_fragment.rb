module RBML
  class HTMLFragment < Fragment
    def initialize(tag_name, *args, &body)
      text(args.shift) if args.first.is_a?(String)
      attributes = args.shift || {}

      @tag_name = tag_name
      @attributes = attributes
      instance_eval(&body) if body
    end

    def to_html(indent = 0)
      "#{"\t"*indent}<#{@tag_name}#{attributes_html}>\n#{inner_html(indent+1)}\n#{"\t"*indent}</#{@tag_name}>"
    end

    private

    def inner_html(indent = 0)
      contents.map{|fragment| fragment.to_html(indent)}.join("\n")
    end

    def attributes_html
      " " + @attributes.map{|attribute, value| "#{attribute}='#{value}'"}.join(" ") unless @attributes.empty?
    end
  end
end
