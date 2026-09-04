Rails.application.routes.draw do
  resources :documents, only: %i[index show create update destroy]
end