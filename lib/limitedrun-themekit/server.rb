require 'sinatra'

module Limitedrun
  module Themekit
    class Server < Sinatra::Application
      get '/' do
        render 'index.html'
      end

      private

      def render(template)
        Renderer.new(Config.theme_path).render(template)
      end
    end
  end
end
