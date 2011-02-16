class SkillCategory < ActiveRecord::Base
  attr_accessible :category
  has_many :required_skills, :dependent => :destroy
  
  validates_presence_of :category
  validates_uniqueness_of :category
    
  def categories_array
    array=[]
    categories=all
    categories.each do |c|
      array << c.category
    end
    array
  end
end
