require 'sinatra'

module Limitedrun
  module Themekit
    class Server < Sinatra::Application
      get '/' do
        render 'index.html'
      end

      get '/news' do
        render 'news.html', news: Proc.new { store.news }
      end

      get '/news/posts/:item' do
        render 'news-item.html', item: Proc.new { store.news.items.first }
      end

      get '/store' do
        # Put all products in all categories
        render 'category.html', category: Proc.new { store.categories.first.merge('products' => store.products) }
      end

      get '/categories/:category' do
        # Put all products in all categories
        render 'category.html', category: Proc.new { store.categories.find { |c| c.url == request_path }.merge('products' => store.products) }
      end

      get '/products/:slug' do
        render 'product.html', product: Proc.new { store.products.find { |p| p.url == request_path } }
      end

      get '/artists' do
        render 'roster.html', roster: Proc.new { store.roster }
      end

      get '/artists/:item' do
        # Associate all products with all roster items
        render 'roster-item.html', item: Proc.new {
          store.roster.items.find { |i| i.url == request_path }.merge('products' => store.products)
        }
      end

      get '/contact' do
        render 'contact.html'
      end

      get '/stylesheets/:file' do
        content_type :css

        css = File.read(File.join(Config.theme_path, Config.stylesheets_dir, params[:file]))
        Renderer.new(Config.theme_path).render_string(css)
      end

      get '/javascripts/:file' do
        send_file File.join(Config.theme_path, Config.javascripts_dir, params[:file])
      end

      private

      def render(template, assigns = nil)
        # For the include tag
        Liquid::Template.file_system = Liquid::LocalFileSystem.new(
          File.join(Limitedrun::Themekit::Config.theme_path, Limitedrun::Themekit::Config.snippets_dir)
        )

        Renderer.new(Config.theme_path, request.path_info).render(template, assigns)
      end
    end
  end
end
