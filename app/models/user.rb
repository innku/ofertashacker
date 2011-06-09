class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  attr_accessor :message
  
  validates :name, :password, :password_confirmation, :message, :presence => true
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 6

  def want_to_register?
    !self.password.blank? && !self.password_confirmation.blank?
  end

end
