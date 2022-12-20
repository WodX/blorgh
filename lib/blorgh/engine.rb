# frozen_string_literal: true

require 'rails/generators'

module Blorgh
  class Engine < ::Rails::Engine
    isolate_namespace Blorgh
  end
end
