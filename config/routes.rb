Rails.application.routes.draw do
  get 'public_recipe/index'
  get 'public_recipes/index'
  get 'foods/new'
  get 'foods/create'
  devise_for :users
  root 'recipes#index'
  resources :recipes, only: %i[index show destroy] do
    collection do
      get 'public_recipe', to: 'recipes#public_recipe'
    end
  end
  resources :foods, only: %i[index new create destroy]
  resources :public_recipes, only: %i[index]
end
