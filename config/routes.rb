# frozen_string_literal: true

Blorgh::Engine.routes.draw do
  root to: 'logger#index'
  get '/redis_data', to: 'logger#redis_data'
end
