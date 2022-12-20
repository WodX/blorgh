# frozen_string_literal: true

require_dependency 'blorgh/application_controller'

module Blorgh
  class LoggerController < ApplicationController
    def index
    end

    def redis_data
      render json: Blorgh::Logger.redis_data.map { |_, k| k }
    end
  end
end
