require 'liquid'
require 'liquid/tags/paginate'
require 'liquid/filters'
require 'hashie'
require 'json'

module Limitedrun
  module Themekit
    class Renderer < Struct.new(:theme_path)
      def render(template, template_assigns = nil)
        assigns = global_assigns

        if template_assigns
          template_assigns.each_key do |k|
            unless template_assigns[k].is_a?(Hashie::Mash)
              template_assigns[k] = Hashie::Mash.new(template_assigns[k])
            end
          end

          assigns.merge!(global_assigns.stringify_keys)
        end

        layout = parse_template File.join(Limitedrun::Themekit::Config.layouts_dir, 'default.html')
        template = parse_template File.join(Limitedrun::Themekit::Config.templates_dir, template)

        layout.render(assigns.merge('content' => template.render(assigns)))
      end

      def render_string(string)
        Liquid::Template.parse(string).render('config' => theme_config)
      end

      protected

      # Assignments for all liquid templates
      def global_assigns
        { 'config' => theme_config, 'store' => store }
      end

      # Theme configuration extracted from config/defaults.js and store.config overrides
      def theme_config
        return @theme_config if @theme_config

        settings = JSON.parse(
          File.read(
            File.join(
              Limitedrun::Themekit::Config.theme_path,
              Limitedrun::Themekit::Config.configs_dir,
              'default.json'
            )
          )
        )['settings']

        config = {}

        settings.each do |k, v|
          config[k] = v['default'] if v['default']
        end

        if store && store.config
          store.config.each { |k, v| config[k] = v }
        end

        @config = config
      end

      # Store mock data model loaded from store.json
      def store
        @store ||= Hashie::Mash.new(JSON.parse(File.read(File.join(Limitedrun::Themekit::Config.theme_path, 'store.json'))))
      end

      def parse_template(template)
        Liquid::Template.parse(
          File.read(
            File.join(
              Limitedrun::Themekit::Config.theme_path,
              template
            )
          )
        )
      end
    end
  end
end
