class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :public, inclusion: { in: [true, false] }

  def shopping_list(current_user)
    shopping_list = []
    user_food_list = Food.where(user_id: current_user.id).all

    recipe_foods.each do |recipe_food|
      food = user_food_list.find_by(id: recipe_food.food_id)

      next unless !user_food_list.include?(recipe_food.food) || recipe_food.quantity > food.quantity

      shopping_list << {
        **food.attributes,
        'quantity' => recipe_food.quantity - food.quantity
      }
    end
    shopping_list
  end
end
