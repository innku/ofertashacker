C = Company.find_or_initialize_by_role(
  :email => "admin@innku.com",
  :title => "Innku",
  :city => "Monterrey",
  :password => "secret",
  :password_confirmation => "secret",
  :description => "Agile web solutions",
  :role => 'admin' )
C.save
C.role='admin'
C.confirmed_at=Time.now
C.save

#create skills
SkillCategory.create(:category=>'Front end')  
SkillCategory.create(:category=>'Back end')  
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'Ruby', :skill_category_id => 2) 
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'CSS', :skill_category_id => 1)
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'JQuery', :skill_category_id => 1)
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'MySql', :skill_category_id => 2)
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'Sinatra', :skill_category_id => 2)
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'Ajax', :skill_category_id => 1)
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'Javascript', :skill_category_id => 1)

Job.create(:company_id => 1, :title => "Ruby developer", :description => "nada", :city => "Monterrey, NL, MX" ).save
Job.create(:company_id => 1, :title => "Sinatra master", :description => "nada", :city => "Monterrey, NL, MX" ).save
Job.create(:company_id => 1, :title => "Front end expert", :description => "nada", :city => "Monterrey, NL, MX" ).save
Job.create(:company_id => 1, :title => "Excelente programador", :description => "nada", :city => "Monterrey, NL, MX" ).save
Job.create(:company_id => 1, :title => "Administrador de bases de datos", :description => "nada", :city => "Monterrey, NL, MX" ).save
