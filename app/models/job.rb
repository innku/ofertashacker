require "twitter"

class Job < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  belongs_to :company
  has_and_belongs_to_many :required_skills

  accepts_nested_attributes_for :required_skills

  validates_presence_of :company_id, :title, :description, :country
  validates_presence_of :at_least_one_type
  validate :extra_skill, :length => {:maximum => 140}

  FILTERS = %w{full_time part_time flexible remote}

  after_create :update_social_networks
  before_create :set_expiration_date

  metropoli_for :city
  metropoli_for :country

  scope   :ordered, order('id DESC')
  scope   :date_sorted, order("jobs.publish_date DESC")
  scope   :not_expired, where("expiration_date > CURRENT_TIMESTAMP")
  scope   :expire_today, where("Date(expiration_date) == CURRENT_DATE ")

  def self.filter_it(filters={})
    results = Job.includes(:company)
    unless filters.blank?
      results = results.where(FILTERS.collect do |filter|
        %|jobs.#{filter} = 't'| if eval(filters[filter.to_sym]) 
      end.compact.join(' OR '))
    end
    results
  end

  def self.from_country(id)
    where(:country_id => id)
  end

  def self.from_city(id)
    where(:city_id => id)
  end

  def self.with_keywords(keywords)
    search_fields = %w{jobs.title companies.title required_skills.skill_name}
    includes(:company, :required_skills).where(Helpers::LikeStatement.new(search_fields, keywords).to_array)
  end

  def self.next_jobs_batch(batch_size, last_date=DateTime.now + 1.second) # "1.second" is added for jobs that have just been created
    date_sorted.limit(batch_size).where("jobs.publish_date < ?", last_date)
  end

  def update_social_networks
    if Rails.env == 'production' or Rails.env == 'staging'
      Services::SocialNetworks::Updater.new(self.company.title, self.id, self.title).post_all
    end
  end

  def set_expiration_date
    self.expiration_date = 60.days.from_now.beginning_of_day
  end

  def expire!
    self.expiration_date = DateTime.now.beginning_of_day
    self.save
  end

  def publish!
    set_expiration_date
    self.publish_date = DateTime.now
    self.save
  end

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def at_least_one_type
    full_time || part_time || remote || flexible
  end

  def format_extra_skills
    extra_skill.split(',')
  end

  def formated_description
    self.description.gsub(/^h2\./,'h3.').gsub(/^h1\./,'h2.')
  end

  def latest_required_skills
    required_skills.all(:limit => 4, :order => "id desc" )
  end
  
  def to_s
    title
  end

  def origin
    city_name || country_name || city2
  end
  
  def has_logo
    logo.file?
  end

  def logo_url
    logo.url(:thumb)
  end
  
  def as_json(args={})
    args ||= {}
    super(args.merge!(:methods =>[:to_param, :origin, :logo_url, :has_logo] ,:include => {:company => {:only => [:title]}}))
  end
  
  private

  def logo
    company.logo
  end

end
