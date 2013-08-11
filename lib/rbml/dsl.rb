module RBML
  module DSL
    TAGS = %w[
      html head body
      script link
      title
      h1 h2 h3 h4 h5
      div
      a
      b
      p
    ].map(&:to_sym)

    TAGS.each do |tag|
      define_method(tag) do |*args, &block|
        new_fragment = HTMLFragment.new(tag, *args, &block)
        contents << new_fragment
        new_fragment
      end
    end

    def text(string)
      text_fragment = Text.new(string)
      contents << text_fragment
      text_fragment
    end
  end
end
