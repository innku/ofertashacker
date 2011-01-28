class Company < ActiveRecord::Base
  
<<<<<<< HEAD



=======
>>>>>>> master
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :jobs
  
  validates_presence_of :title, :description, :city
  validates_attachment_content_type :logo, :content_type => ['image/jpg','image/jpeg', 'image/png']
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :title, :city, :logo, :description
	metropoli_for :city, :as=>:city_name
  scope :members, where(:role => "member")
  
  has_attached_file :logo, :styles => {:medium => "300x300>", :thumb => "100x100>"},
                            :storage => {
                              'development' => :filesystem,
                              'test' => :filesystem,
                              'staging' => :s3,
                              'production' => :s3
                            }[Rails.env],
                            :s3_credentials => "#{Rails.root}/config/s3.yml",
                            :url => "#{ENV['RAILS_ENV']}/:attachment/:id/:style/:basename.:extension",
                            :path => "public/files/#{Rails.env}/:attachment/:id/:style/:basename.:extension",
                            :bucket => 'rubypros',
                            :default_url => "/images/missing.png"
                            
  def admin?
    self.role == "admin"
  end
  
  def member?
    self.role == "member"
  end
end
