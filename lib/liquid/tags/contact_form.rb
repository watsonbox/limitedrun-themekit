module Liquid
  module Tags
    class ContactForm < Liquid::Block
      def initialize(tag_name, markup, tokens)
         super
      end

      def render(context)
        %{<form>#{super}</form>}
        super
      end
    end
  end
end

Liquid::Template.register_tag('contact_form', Liquid::Tags::ContactForm)
