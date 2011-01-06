class Job < ActiveRecord::Base
  
  belongs_to :company
  has_many :required_skills, :dependent => :destroy
  
  accepts_nested_attributes_for :required_skills
  
end
