module Limitedrun
  module Themekit
    class Renderer < Struct.new(:theme_path)
      def render(template)
        File.read(File.join(theme_path, Limitedrun::Themekit::Config.templates_dir, template))
      end
    end
  end
end
