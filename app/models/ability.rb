class Ability
  include CanCan::Ability

  def initialize(company)
    company ||=Company.new :role => 'guest'
    alias_action [:my_jobs], :to => :my_jobs

    if company.admin?
      can :manage, Company do |c|
        c == company
      end
      can :manage, RequiredSkill
      can :read, Company
      can :manage, Company
      can :create, Job
      can :manage, Job do |j|
        j.company == company
      end
    elsif company.member?
      can :read, RequiredSkill
      can :read, Company
      can :my_jobs, Company do |c|
        c == company
      end
      can :update, Company do |c|
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
