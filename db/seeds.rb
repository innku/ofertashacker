Company.destroy_all

Company.create(
  :email => "admin@innku.com",
  :title => "Innku",
  :city => "Monterrey",
  :password => "secret",
  :password_confirmation => "secret",
  :description => "Agile web solutions",
  :role => "admin" )
  
Company.create(
  :email => "admin@apple.com",
  :title => "Apple",
  :city => "Silicon",
  :password => "secret",
  :password_confirmation => "secret",
  :description => "Macworld",
  :role => "admin" )
  

