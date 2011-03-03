# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#Create Companies
Company.delete_all
company = Company.find_or_initialize_by_role(
  :email => "admin@innku.com",
  :title => "Innku",
  :city => "Monterrey",
  :password => "secret",
  :password_confirmation => "secret",
  :description => "Agile web solutions")
company.save
company.role='admin'
company.confirmed_at=Time.now
company.save

#Create skill categories
SkillCategory.delete_all
front = SkillCategory.create(:category =>'Front end')  
front.save
back = SkillCategory.create(:category =>'Back end')  
back.save

#Create required skills
RequiredSkill.delete_all
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


#Create Job offers
Job.delete_all
Job.create [
  {:company => company, :title => "Ruby developer", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :full_time => true },
  {:company => company, :title => "Sinatra master", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :part_time => true },
  {:company => company, :title => "Front end expert", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :full_time => true, :part_time => true },
  {:company => company, :title => "Excelente programador", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :part_time => true },
  {:company => company, :title => "Rails lover", :description => "Agregame required skills!", :city => "Monterrey, NL, MX", :full_time => true }
]

