require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(name: 'Bills', email: 'yes@gmail.com', password: '123456') }
  let(:food) do
    Food.create!(
      name: 'rice',
      measurement_unit: 'kg',
      price: 60,
      quantity: 50,
      user_id: user.id
    )
  end

  it 'is valid with valid attributes' do
    expect(food).to be_valid
  end

  it 'is invalid without a name' do
    food = Food.create(name: nil)
    expect(food).to_not be_valid
    expect(food.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a measurement_unit' do
    food = Food.create(measurement_unit: nil)
    expect(food).to_not be_valid
    expect(food.errors[:measurement_unit]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    food = Food.create(price: nil)
    expect(food).to_not be_valid
    expect(food.errors[:price]).to include("can't be blank")
  end

  it 'is invalid with a name longer than 100 characters' do
    food = Food.create(name: 'a' * 101)
    expect(food).to_not be_valid
    expect(food.errors[:name]).to include('is too long (maximum is 100 characters)')
  end

  it 'is invalid with a negative price' do
    food = Food.create(price: -10)
    expect(food).to_not be_valid
    expect(food.errors[:price]).to include('must be greater than or equal to 0')
  end
end
