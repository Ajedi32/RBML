module RBML
  class HTMLFragment < Fragment
    def initialize(tag_name, *args, &body)
      @tag_name = tag_name

      text(args.shift) if args.first.is_a?(String)
      @attributes = args[0] || {}
      @options = args[1] || {}

      instance_eval(&body) if body
    end

    def to_html(indent = 0)
      html = "<#{@tag_name}#{attributes_html}>"

      html << "\n" unless @options[:inline] || contents.empty?
      html << inner_html(indent+1)

      html << "\n#{"\t"*indent}" unless @options[:inline] || contents.empty?
      html << "</#{@tag_name}>"

      return html
    end

    private

    def inner_html(indent = 0)
      html = contents.map{|fragment| fragment.to_html(indent)}
      html = html.join("\n#{"\t"*indent}")
      html = ("\t"*indent) + html unless @options[:inline] || contents.empty?

      return html
    end

    def attributes_html
      " " + @attributes.map{|attribute, value| "#{attribute}='#{value}'"}.join(" ") unless @attributes.empty?
    end
  end
end
