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
    elsif company.member?
      can :read, SkillCategory 
      can :read, RequiredSkill
      can :read, Company
      can :manage, Company do |c|
        c == company
      end
      can :read, Job
      can :create, Job
      can :manage, Job do |j|
        j.company == company
      end
    else
      can :read, Company
      can :read, Job
    end
  end
  
end
