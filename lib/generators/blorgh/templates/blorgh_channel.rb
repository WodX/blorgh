class BlorghChannel < ApplicationCable::Channel
  def subscribed
    stream_from Blorgh.configuration.channel || 'blorgh_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
