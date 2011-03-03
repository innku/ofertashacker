class Company < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :jobs, :dependent => :destroy
  
  validates_presence_of :title, :email
  validates_attachment_content_type :logo, :content_type => ['image/jpg','image/jpeg', 'image/png', 'image/gif']
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :title, :city, :logo, :description
  attr_accessible :phone1, :phone2, :contact_email, :linkedin, :facebook, :twitter

	metropoli_for :city, :as=>:city_name
  scope :members, where(:role => "member")
  
  has_attached_file :logo, :styles => {:medium => "300x300>", :thumb => "120x29#"},
                            :default_style => :thumb,
                            :storage => {
                              'development' => :filesystem,
                              'test' => :filesystem,
                              'staging' => :s3,
                              'production' => :s3
                            }[Rails.env],
                            :s3_credentials => "#{Rails.root}/config/s3.yml",
                            :url => "../files/#{ENV['RAILS_ENV']}/:attachment/:id/:style/:basename.:extension",
                            :path => "public/files/#{Rails.env}/:attachment/:id/:style/:basename.:extension",
                            :bucket => 'rubypros',
                            :default_url => "/images/shareIcon.gif"
                            
  def admin?
    self.role == "admin"
  end
  
  def member?
    self.role == "member"
  end
  def logo_url
    self.logo.path[6..-1]
  end
end

