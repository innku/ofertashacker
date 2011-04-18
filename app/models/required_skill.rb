class RequiredSkill < ActiveRecord::Base
  
  belongs_to :job
  validates_uniqueness_of :skill_name
  validates_presence_of :skill_name
  
end
