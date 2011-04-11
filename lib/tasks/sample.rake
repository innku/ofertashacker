require 'factory_girl'

desc 'Seeds sample jobs and categories'
namespace :db do
  namespace :seed do
    task :sample => :environment do 
      
      company = Company.create(
        :email => "sample@company.com",
        :title => "Sample Company",
        :city => "Monterrey",
        :website => 'www.innku.com',
        :password => "secret",
        :password_confirmation => "secret",
        :description => "Web solutions")
      company.confirmed_at=Time.now
      company.save
      
      if SkillCategory.count.zero?
        front = SkillCategory.create(:category =>'Front end')  
        back = SkillCategory.create(:category =>'Back end')
      end
          
      if RequiredSkill.count.zero?
        RequiredSkill.create [
          {:skill_name =>'Ajax', :skill_category => front },
          {:skill_name =>'Javascript', :skill_category => front },
          {:skill_name =>'CSS', :skill_category => front },
          {:skill_name =>'JQuery', :skill_category => front },
          {:skill_name =>'MySql', :skill_category => back },
          {:skill_name =>'Sinatra', :skill_category => back },
          {:skill_name =>'Ruby', :skill_category => back },
          {:skill_name =>'Ruby on Rails', :skill_category => back }
        ]
      end

      if Job.count.zero?
        Factory(:job_for_seed, :full_time=>true, :title=> "Buen rubyero", :company =>  Company.last)
          Factory(:job_for_seed, :full_time=>true, :title=> "MySql Pro",:company =>  Company.last)
          Factory(:job_for_seed, :part_time=>true, :title=> "Mister Ruby",:company =>  Company.first)
          Factory(:job_for_seed, :part_time=>true, :title=> "Rails Lover",:company =>  Company.last)
          Factory(:job_for_seed, :remote=>true, :title=> "Fron end expert",:company =>  Company.first)
          Factory(:job_for_seed, :remote=>true, :title=> "Sinatra master",:company =>  Company.last)
          Factory(:job_for_seed, :flexible=>true, :title=> "Ruby developer",:company =>  Company.first)
          Factory(:job_for_seed, :flexible=>true, :title=> "Excelente programador",:company =>  Company.last)
          Factory(:job_for_seed, :full_time=>true, :title=> "Diseñador Web", :company =>  Company.last)
          Factory(:job_for_seed, :full_time=>true, :title=> "API Developer",:company =>  Company.last)
          Factory(:job_for_seed, :flexible=>true, :title=> "Test Driven engineer",:company =>  Company.first)
          Factory(:job_for_seed, :flexible=>true, :title=> "Rails Ninja",:company =>  Company.last)
          Factory(:job_for_seed, :full_time=>true, :title=> "Programador de Ruby", :company =>  Company.last)
          Factory(:job_for_seed, :full_time=>true, :title=> "Ruby on Rails developer",:company =>  Company.last)
          Factory(:job_for_seed, :part_time=>true, :title=> "BDD Tester",:company =>  Company.first)
          Factory(:job_for_seed, :part_time=>true, :title=> "Web app developer",:company =>  Company.last)
          Factory(:job_for_seed, :remote=>true, :title=> "Software engenner",:company =>  Company.first)
          Factory(:job_for_seed, :remote=>true, :title=> "MySql GURU",:company =>  Company.last)
          Factory(:job_for_seed, :flexible=>true, :title=> "Test Driven engineer",:company =>  Company.first)
          Factory(:job_for_seed, :flexible=>true, :title=> "Rails Ninja",:company =>  Company.last)
      end   
    end
  end
end

