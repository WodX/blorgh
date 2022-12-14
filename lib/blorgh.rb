# frozen_string_literal: true

require 'blorgh/version'
require 'blorgh/engine'

module Blorgh
  # This do stuff
  class Logger
    class << self
      def broadcast_message(channel, status, payload)
        ActionCable.server.broadcast channel, { status: status, payload: payload }
      end
    end
  end
end
