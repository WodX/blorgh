# frozen_string_literal: true

module Blorgh
  # This class will initialize the configuration
  class Configuration
    attr_accessor :channel, :persist, :all_exceptions

    def initialize
      @channel = 'blorgh_channel'
      @persist = false
      @all_exceptions = false
    end
  end
end
