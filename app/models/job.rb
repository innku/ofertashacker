class Job < ActiveRecord::Base
  
  belongs_to :company
  has_and_belongs_to_many :required_skills
  
  accepts_nested_attributes_for :required_skills
  
  validates_presence_of :company_id, :title, :description, :city
  validates_presence_of :at_least_one_type
	
	FILTERS = %w{full_time part_time flexible remote}
	
	metropoli_for :city, :as => :city_name
	
	scope   :ordered, order('id DESC')
	
  def self.filter_it(filters={}, company=nil)
    results = Job.includes(:company)
      unless filters.blank?
        results = results.where(FILTERS.collect do |filter|
          %|jobs.#{filter} = 't'| if eval(filters[filter.to_sym]) 
        end.compact.join(' OR '))
	    end
	  results
  end

	
  def at_least_one_type
    full_time || part_time || remote || flexible
  end

end
