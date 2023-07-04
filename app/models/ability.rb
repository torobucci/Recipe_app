class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    # Allow owners to delete their own recipes
    can :destroy, Recipe, user_id: user.id
  end
end
