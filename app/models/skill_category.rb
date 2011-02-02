class SkillCategory < ActiveRecord::Base
  has_many :required_skills
  attr_accessible :category
  
  validates_presence_of :category
  validates_uniqueness_of :category
  
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
