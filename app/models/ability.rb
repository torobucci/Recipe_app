class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Recipe, user_id: user.id
  end
end
