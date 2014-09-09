require 'sinatra'

module Limitedrun
  module Themekit
    class Server < Sinatra::Application
      get '/' do
        render 'index.html'
      end

      get '/stylesheets/:file' do
        content_type :css

        css = File.read(File.join(Config.theme_path, Config.stylesheets_dir, params[:file]))
        Renderer.new(Config.theme_path).render_string(css)
      end

      get '/javascripts/:file' do
        send_file File.join(Congif.theme_path, Config.javascripts_dir, params[:file])
      end

      private

      def render(template)
        Renderer.new(Config.theme_path).render(template)
      end
    end
  end
end
