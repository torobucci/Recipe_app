Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes, only: %i[index show destroy] do
    patch :toggle_public, on: :member
  end
  resources :foods, only: %i[index new create]
  resources :recipe_foods, only: %i[index create] do
    get 'new/:id', to: 'recipe_foods#new', as: 'new'
  end
  resources :public_recipes, only: %i[index]
end
