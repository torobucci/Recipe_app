require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with valid attributes' do
    user = User.create!(name: 'John Doe', email: 'doe@gmail.com', password: '123456')
    recipe = Recipe.new(
      name: 'Chocolate Cake',
      preparation_time: 30,
      cooking_time: 60,
      description: 'A delicious chocolate cake recipe',
      public: true,
      user_id: user.id
    )
    expect(recipe).to be_valid
  end

  it 'is invalid without a name' do
    recipe = Recipe.new(name: nil)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a preparation_time' do
    recipe = Recipe.new(preparation_time: nil)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:preparation_time]).to include("can't be blank")
  end

  it 'is invalid without a cooking_time' do
    recipe = Recipe.new(cooking_time: nil)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:cooking_time]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    recipe = Recipe.new(description: nil)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a name longer than 100 characters' do
    recipe = Recipe.new(name: 'a' * 101)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:name]).to include('is too long (maximum is 100 characters)')
  end

  it 'is invalid with a description longer than 1000 characters' do
    recipe = Recipe.new(description: 'a' * 1001)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:description]).to include('is too long (maximum is 1000 characters)')
  end

  it 'is invalid with a negative preparation_time' do
    recipe = Recipe.new(preparation_time: -10)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:preparation_time]).to include('must be greater than or equal to 0')
  end

  it 'is invalid with a negative cooking_time' do
    recipe = Recipe.new(cooking_time: -10)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:cooking_time]).to include('must be greater than or equal to 0')
  end

  it 'is invalid without a public attribute' do
    recipe = Recipe.new(public: nil)
    expect(recipe).to_not be_valid
    expect(recipe.errors[:public]).to include('is not included in the list')
  end
end
