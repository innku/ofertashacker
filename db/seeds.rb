company = Company.find_or_initialize_by_role(
  :email => "admin@innku.com",
  :title => "Innku",
  :city => "Monterrey",
  :password => "secret",
  :password_confirmation => "secret",
  :description => "Agile web solutions",
  :role => 'admin')
company.save
company.role='admin'
company.confirmed_at=Time.now
company.save
