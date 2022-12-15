# frozen_string_literal: true
require "redis"

module Blorgh
  # Logger contains the methods to broadcast a message
  class Logger
    class << self
      @@ttl = 1.minute
      @@limit = 5

      def broadcast_message(payload)
        message = Blorgh.configuration.persist ? redis_persist(payload) : payload
        ActionCable.server.broadcast Blorgh.configuration.channel, message
      end

      private
      
      def to_ms(time)
        (time.to_f * 1000.0).to_i
      end

      def redis_persist(payload)
        redis = Redis.new
        timestamp_ms = self.to_ms(Time.now)
        min_timestamp = timestamp_ms - self.to_ms(@@ttl)
        redis.xadd(Blorgh.configuration.channel, *payload, id: "#{timestamp_ms}-0")
        redis.call(['xtrim', Blorgh.configuration.channel, 'minid', '=', "#{min_timestamp}-0"])
        redis.xrevrange(Blorgh.configuration.channel, '+', '-', count: @@limit)
      end
    end
  end
end
