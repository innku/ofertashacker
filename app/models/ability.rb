class Ability
  include CanCan::Ability
  
  def initialize(company)
    if company.admin?
      can :manage, Company do |c|
        c == company
      end
      can :read, Company
      can :create, Job
      can :manage, Job do |j|
        j.company == company
      end
    else
      can :manage, Company do |c|
        c == company
      end
      can :create, Job
      can :manage, Job do |j|
        j.company == company
      end
    end
  end
end