# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :file_records, only: [:create, :show, :destroy] do
        member do
          get :download
        end
      end
    end
  end

  # Health check endpoint
  get "/health", to: proc { [200, {}, ["OK"]] }
end