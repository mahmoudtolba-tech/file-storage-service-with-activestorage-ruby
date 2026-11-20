Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :files, only: [:index, :create, :show, :destroy]
    end
  end

  # Mount ActiveStorage routes for direct uploads (optional)
  # Note: In production you might disable this endpoint.
  # direct_upload: true enables the built‑in API.
  mount Rails.application.routes.url_helpers => "/rails/active_storage"
end