module Liquid
  module Tags
    class Captcha < Liquid::Tag
      def initialize(tag_name, args, tokens)
         super
      end

      def render(context)
        %{
        <script type="text/javascript">
        var RecaptchaOptions = {"theme":"clean"};
        </script><script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k=6LdWsM8SAAAAAH-DqFDbCl656cx5203ZoGpZxGLs">
        </script>
        }
      end
    end
  end
end

Liquid::Template.register_tag('captcha', Liquid::Tags::Captcha)
