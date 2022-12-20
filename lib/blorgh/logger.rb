# frozen_string_literal: true

require 'redis'

module Blorgh
  # Logger contains the methods to broadcast a message
  class Logger
    @ttl = 1.minute
    @limit = 5

    class << self
      def error(payload)
        broadcast_message(format_payload('error', payload))
      end

      def warn(payload)
        broadcast_message(format_payload('warn', payload))
      end

      def info(payload)
        broadcast_message(format_payload('info', payload))
      end

      def handle_exception(payload)
        return unless Blorgh.configuration.all_exceptions

        broadcast_message(format_payload('exception', payload))
      end

      def redis_data
        redis = Redis.new
        min_timestamp = to_ms(Time.now) - to_ms(@ttl)
        redis.call(['xtrim', Blorgh.configuration.channel, 'minid', '=', "#{min_timestamp}-0"])
        redis.xrevrange(Blorgh.configuration.channel, '+', '-', count: @limit)
      end

      private

      def format_payload(type, payload)
        { type: type, time: to_ms(Time.now), message: payload.to_json, groupId: '0' }
      end

      def broadcast_message(*payload)
        redis_persist(payload) if Blorgh.configuration.persist
        ActionCable.server.broadcast Blorgh.configuration.channel, payload
      end

      def to_ms(time)
        (time.to_f * 1000.0).to_i
      end

      def redis_persist(payload)
        redis = Redis.new
        timestamp_ms = to_ms(Time.now)
        min_timestamp = timestamp_ms - to_ms(@ttl)
        redis.xadd(Blorgh.configuration.channel, *payload, id: "#{timestamp_ms}-0")
        redis.call(['xtrim', Blorgh.configuration.channel, 'minid', '=', "#{min_timestamp}-0"])
        redis.xrevrange(Blorgh.configuration.channel, '+', '-', count: @limit)
      end
    end
  end
end
