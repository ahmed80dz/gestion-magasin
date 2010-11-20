class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.role? :root
      can :manage, :all
    else
      can :read, :all
      if user.role?(:user)
        can :create, Produit
        can :update, Produit
      end
    end
  end
end