class SkillCategory < ActiveRecord::Base
  has_many :required_skills
  attr_accessible :category
end
