# frozen_string_literal: true

module Blorgh
  # This class will initialize the configuration
  class Configuration
    attr_accessor :channel, :persist

    def initialize
      @channel = 'kek_channel'
      @persist = false
    end
  end
end
