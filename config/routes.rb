Rails.application.routes.draw do
  get 'foods/new'
  get 'foods/create'
  devise_for :users
  root 'recipes#index'
  resources :recipes, only: %i[index show destroy]
  resources :foods,only: %i[index new create]
end
