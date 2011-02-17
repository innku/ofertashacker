class Job < ActiveRecord::Base
  
  belongs_to :company
  has_and_belongs_to_many :required_skills
  
  accepts_nested_attributes_for :required_skills
  
  validates_presence_of :company_id, :title, :description, :city
  validates_presence_of :full_time, :if=> :not_part_time_present
	
	SEARCH_TYPES = ['Title','Company', 'City']
	
	metropoli_for :city, :as => :city_name

  def self.filter_it(full_time,part_time,flexible,remote)
    jobs=Job.all
    if full_time=="false"
        jobs=where(:full_time=>false)
    end
    if part_time=="false"
        jobs=where(:part_time=>false)
    end
    if flexible=="false"
        jobs=where(:flexible=>false)
    end
    if remote=="false"
        jobs=where(:remote=>false)
    end
    jobs 
  end

	
  def not_part_time_present
    !part_time
  end
  

  def required_skill_ids_string=(string_ids)
    unless string_ids.blank?
      self.required_skill_ids = string_ids.split(',')
    else
      self.required_skill_ids = []
    end
  end 
  
  def required_skill_ids_string
    id_collection = required_skills.collect{|rs| rs.id }
    id_collection.inject(""){|result,id| result += (id.to_s + (id == id_collection.last ?  '' : ','))}
  end

  
  #search simple de trabajos
  def self.search(search, type)
    if search
      find(:all, :conditions => [''+type+' LIKE ?', "%#{search}%"], :order=>'created_at DESC')
    else
      find(:all, :order=>'created_at DESC')
    end
  end
end
