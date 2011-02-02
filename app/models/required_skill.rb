class RequiredSkill < ActiveRecord::Base
  
  belongs_to :job
  belongs_to :skill_category
  validates_uniqueness_of :skill_name

  validates_presence_of :skill_name, :skill_category_id
  
end
