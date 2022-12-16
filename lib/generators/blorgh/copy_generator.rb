require 'rails/generators'

module Blorgh
  module Generators
    class CopyGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_from_directories
        blorgh_channel_rb_path = "app/channels/blorgh_channel.rb"
        blorgh_channel_js_path = "app/javascript/channels/blorgh_channel.js"
        copy_file 'blorgh_channel.rb', blorgh_channel_rb_path unless File.exists?(blorgh_channel_rb_path)
        copy_file 'blorgh_channel.js', blorgh_channel_js_path unless File.exists?(blorgh_channel_js_path) 
      end
    end
  end
end
