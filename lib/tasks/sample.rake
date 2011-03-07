desc 'Seeds sample jobs and categories'
namespace :db do
  namespace :seed do
    task :sample => :environment do 
      
      company = Company.create(
        :email => "sample@company.com",
        :title => "Sample Company",
        :city => "Monterrey",
        :password => "secret",
        :password_confirmation => "secret",
        :description => "Agile web solutions")
      
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
        Job.create [
          {:company => company, :title => "Ruby developer", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :full_time => true },
          {:company => company, :title => "Sinatra master", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :part_time => true },
          {:company => company, :title => "Front end expert", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :full_time => true, :part_time => true },
          {:company => company, :title => "Excelente programador", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :part_time => true },
          {:company => company, :title => "Rails lover", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :full_time => true }
        ]  
      end   
    end
  end
end