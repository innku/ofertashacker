class SkillCategory < ActiveRecord::Base
  has_many :required_skills
  attr_accessible :category
  
  CATEGORIES = ['Front end', 'Back end']
  
  def categories_array
    array=[]
    categories=all
    categories.each do |c|
      array << c.category
    end
    array
  end
end
