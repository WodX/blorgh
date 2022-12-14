# frozen_string_literal: true

require 'blorgh/version'
require 'blorgh/engine'
require 'blorgh/configuration'
require 'blorgh/logger'

module Blorgh
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
