class RequiredSkill < ActiveRecord::Base

  has_and_belongs_to_many :jobs

  validates_uniqueness_of :skill_name
  validates_presence_of :skill_name

	scope   :ordered, order('skill_name')

end
