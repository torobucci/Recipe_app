Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes, only: %i[index show destroy] do
    patch :toggle_public, on: :member
    resources :recipe_foods, only: %i[new create]
  end
  resources :foods, only: %i[index new create]
  resources :public_recipes, only: %i[index]
  resources :general_shopping_list, only: %i[index]
end
