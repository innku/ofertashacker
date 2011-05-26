require 'factory_girl'

desc 'Seeds sample jobs and categories'
namespace :db do
  namespace :seed do
    task :sample => :environment do 
      if Company.count <= 1
        company =  Factory(:company,  :email => "company@sample.com",  :title => "Sample Company 1")
        company2 = Factory(:company, :email => "company2@sample.com", :title => "Sample Company 2")
      end

      if RequiredSkill.count.zero?
        Factory(:required_skill, :skill_name => "Javascript")
        Factory(:required_skill, :skill_name => "CSS")
        Factory(:required_skill, :skill_name => "Ruby")
        Factory(:required_skill, :skill_name => "Sinatra")
        Factory(:required_skill, :skill_name => "PHP")
        Factory(:required_skill, :skill_name => "Django")
        Factory(:required_skill, :skill_name => "MySql")
      end

      if Job.count.zero?
        Factory(:job, :full_time=>true, :title=> "MySql Pro",             :company =>  company,  :extra_skill => "Full time job")
        Factory(:job, :part_time=>true, :title=> "Rails Lover",           :company =>  company,  :extra_skill => "Part time job")
        Factory(:job, :remote=>true,    :title=> "Front end expert",      :company =>  company,  :extra_skill => "Remote job")
        Factory(:job, :flexible=>true,  :title=> "Excelente programador", :company =>  company2, :extra_skill => "Flexible job")
        Factory(:job, :full_time=>true, :title=> "API Developer",         :company =>  company2, :extra_skill => "Full time job")
        Factory(:job, :flexible=>true,  :title=> "Rails Ninja",           :company =>  company2, :extra_skill => "Flexible job")
        Factory(:job, :part_time=>true, :title=> "Web app developer",     :company =>  company,  :extra_skill => "Part time job")
        Factory(:job, :remote=>true,    :title=> "Software engineer",     :company =>  company2, :extra_skill => "Remote job")
      end   
    end
  end
end

