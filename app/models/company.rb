class Company < ActiveRecord::Base
  
  production = Rails.env.production?
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :jobs
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :title, :city, :logo, :description
  
  scope :members, where(:role => "member")
  
  has_attached_file :logo, :styles => {:medium => "300x300>", :thumb => "100x100>"},
                            :storage => production ? :s3 : :filesystem,
                            :s3_credentials => "#{Rails.root}/config/s3.yml",
                            :path => production ? ":attachment/:id/:style/:filename" : "public/system/:attachment/:id/:style/:filename",
                            :bucket => "rubypros",
                            :default_url => "/images/missing.jpg"
                            
  def admin?
    self.role == "admin"
  end
end
