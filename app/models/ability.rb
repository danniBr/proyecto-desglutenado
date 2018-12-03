class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    if user.present?
      can :manage, Recipe, user_id: user.id
      can :manage, Question, user_id: user.id
      can :manage, Comment, user_id: user.id
      can :manage, Location, user_id: user.id
      can :create, Like
      #if user.admin?
        #can :manage, :all
      #end
    end
  end
end
