class Job < ActiveRecord::Base
  
  belongs_to :company
  has_many :required_skills, :dependent => :destroy
  
  accepts_nested_attributes_for :required_skills
  
  validates_presence_of :company_id, :title, :description, :state
  validates_presence_of :full_time, :if=> :not_part_time_present
	metropoli_for :state, :as => :sate_name
  def not_part_time_present
    !part_time
  end
  

  def skills_to_delete(ids)
    ids.map {|id| self.required_skills.find(id).destroy }
  end      
  
end
