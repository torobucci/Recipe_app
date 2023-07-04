Rails.application.routes.draw do
  root 'recipes#index'
  resources :recipes, only: %i[index show destroy]
end
