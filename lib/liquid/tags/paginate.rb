module Liquid
  module Tags
    # Pass-through for now before better implementation
    class Paginate < Liquid::Block
      def initialize(tag_name, markup, tokens)
         super
      end

      def render(context)
        super
      end
    end
  end
end

Liquid::Template.register_tag('paginate', Liquid::Tags::Paginate)
