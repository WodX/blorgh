# frozen_string_literal: true

module Blorgh
  # This class will initialize the configuration
  class Configuration
    attr_accessor :channel, :precist

    def initialize
      @channel = 'kek_channel'
      @precist = false
    end
  end
end
