class Ability
  include CanCan::Ability

  def initialize(resource)
    if resource.class == User
      can :manage, User do |u|
        u == resource
      end
    else
      resource ||=Company.new :role => 'guest'
      alias_action [:my_jobs], :to => :my_jobs

      if resource.admin?
        can :manage, Company do |c|
          c == resource
        end
        can :manage, RequiredSkill
        can :read, Company
        can :manage, Company
        can :create, Job
        can :manage, Job do |j|
          j.company == resource
        end
        can :manage, User
      elsif resource.member?
        can :read, Company
        can :my_jobs, Company do |c|
          c == resource
        end
        can :update, Company do |c|
          c == resource
        end
        can :read, Job
        can :create, Job
        can :manage, Job do |j|
          j.company == resource
        end
      else
        can :read, Company
        can :read, Job
      end
    end
  end

end
