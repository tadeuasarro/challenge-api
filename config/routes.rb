# frozen_string_literal: true

Rails.application.routes.draw do
  resources :citizen, only: %w[index show create update]
end
