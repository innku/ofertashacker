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
  
