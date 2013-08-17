module RBML
  module DSL
    TAGS = %w[
      html head body
      script link
      h1 h2 h3 h4 h5
      div
      p
      img
    ].map(&:to_sym)

    INLINE_TAGS = %w[
      title
      a
      b
    ].map(&:to_sym)

    TAGS.each do |tag|
      define_method(tag) do |*args, &block|
        new_fragment = HTMLFragment.new(tag, *args, &block)
        contents << new_fragment
        new_fragment
      end
    end

    INLINE_TAGS.each do |tag|
      define_method(tag) do |*args, &block|
        opts_index = 0
        opts_index += 1 if args.first.is_a?(String)
        args[opts_index] ||= {}
        opts_index += 1
        default_opts = {inline: true}
        args[opts_index] = args[opts_index] ? default_opts.merge(args[opts_index]) : default_opts

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
