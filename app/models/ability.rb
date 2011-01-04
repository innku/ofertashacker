class Ability
  include CanCan::Ability
  
  def initialize(company)
    if company.admin?
      can :manage, Company do |c|
        c == company
      end
      can :read, Company
    else
      can :manage, Company do |c|
        c == company
      end
    end
  end
end