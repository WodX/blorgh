require 'rails/generators'

module Blorgh
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh

    initializer :load_channels do
      Rails::Generators.invoke('blorgh:copy')
    end
  end
end
