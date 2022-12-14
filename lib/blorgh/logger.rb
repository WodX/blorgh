# frozen_string_literal: true

module Blorgh
  # Logger contains the methods to briadcast a message
  class Logger
    class << self
      def broadcast_message(payload)
        ActionCable.server.broadcast Blorgh.configuration.channel, payload
      end
    end
  end
end
