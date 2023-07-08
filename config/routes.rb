Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes, only: %i[index show new create destroy] do
    patch :toggle_public, on: :member
    resources :recipe_foods, only: %i[new create destroy]
    resources :general_shopping_list, only: %i[index]
  end
  resources :foods, only: %i[index new create destroy]
  resources :public_recipes, only: %i[index]
end
