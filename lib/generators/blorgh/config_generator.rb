# frozen_string_literal: true

require 'rails/generators'

module Blorgh
  module Generators
    # Copy Generator will copy the necessary files for the action cable if it don't exists
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_from_directories
        blorgh_channel_rb_path = 'app/channels/blorgh_channel.rb'
        blorgh_channel_js_path = 'app/javascript/packs/blorgh_channel.js'
        copy_file 'blorgh_channel.rb', blorgh_channel_rb_path unless File.exist?(blorgh_channel_rb_path)
        copy_file 'blorgh_channel.js', blorgh_channel_js_path unless File.exist?(blorgh_channel_js_path)
      end

      def add_mount_application
        route "mount Blorgh::Engine, at: '/blorgh'"
      end
    end
  end
end
