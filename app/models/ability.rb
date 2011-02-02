class Ability
  include CanCan::Ability
  
  def initialize(company)
    company ||=Company.new :role=>'user'
    if company.admin?
      can :manage, Company do |c|
        c == company
      end
      can :manage, RequiredSkill
      can :manage, SkillCategory
      can :read, Company
      can :create, Job
      can :manage, Job do |j|
        j.company == company
      end
    else  
      can :read, RequiredSkill
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
