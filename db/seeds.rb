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
  
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'Ruby')
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'CSS')
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'JQuery')
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'MySql')
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'Sinatra')
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'Ajax')
RequiredSkill.find_or_create_by_skill_name(:skill_name=>'Javascript')
