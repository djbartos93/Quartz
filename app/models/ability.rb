class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :index, :show, :to => :read
    alias_action :create, :update, :to => :manage

    can :manage, :all if user.admin?
    can :read, :manage, "Cms:Site" if user.admin?
  end
end
