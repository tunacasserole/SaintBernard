Rails.application.routes.draw do
  resources :transfers, only: [:index, :show]
end
