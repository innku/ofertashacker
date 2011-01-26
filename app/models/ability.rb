class Ability
  include CanCan::Ability
  
  def initialize(company, member)
    company ||=Company.new
    if company.admin?
      can :manage, Company do |c|
        c == company
      end
      can :read, Company
      can :create, Job
      can :manage, Job do |j|
        j.company == company
      end
    else if company.member?
      can :manage, Company do |c|
        c == company
      end
      
      can :read, Job
      can :create, Job
      can :manage, Job do |j|
        j.company == company
      end
    end
  end
  
end
