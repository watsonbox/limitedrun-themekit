module Limitedrun
  module Themekit
    class Config
      class << self
        attr_writer :theme_path

        def theme_path
          @theme_path || '.'
        end

        DIRS = [:configs_dir, :layouts_dir, :templates_dir, :stylesheets_dir, :javascripts_dir, :snippets_dir]
        attr_accessor *DIRS

        # Define accessors for directories along with defaults e.g. #configs_dir -> 'configs'
        DIRS.each do |dir|
          define_method dir do
            instance_variable_get("@#{dir}") || dir.to_s.gsub('_dir', '')
          end
        end
      end
    end
  end
end
