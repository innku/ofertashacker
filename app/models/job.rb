class Job < ActiveRecord::Base
  
  belongs_to :company
  has_and_belongs_to_many :required_skills
  
  accepts_nested_attributes_for :required_skills
  
  validates_presence_of :company_id, :title, :description, :city
  validates_presence_of :full_time, :if=> :not_part_time_present
	
	metropoli_for :city, :as => :city_name
	
	scope   :full_time, where(:full_time => false)
	scope   :part_time, where(:part_time => false)
	scope   :remote,    where(:remote => false)
	scope   :flexible, where(:flexible => false)
	scope   :ordered, order('id DESC')

	
  def self.filter_it(filters={})
    results = Job.includes(:company)
      unless filters.blank?  
        results = results.full_time if !eval(filters[:full_time])
        results = results.part_time if !eval(filters[:part_time])
        results = results.flexible if !eval(filters[:flexible])
        results = results.remote if !eval(filters[:remote])
	    end
	  results
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
end
