
desc 'Seeds sample jobs and categories'
namespace :db do
  namespace :seed do
    task :sample => :environment do
      Rake::Task["metropoli:cleanup"].invoke
      Rake::Task["metropoli:seed"].invoke

      if Company.count <= 1
        company =  FactoryGirl.create(:company,  :email => "company@sample.com",  :title => "Sample Company 1")
        company2 = FactoryGirl.create(:company, :email => "company2@sample.com", :title => "Sample Company 2")
      end

      if RequiredSkill.count.zero?
        FactoryGirl.create(:required_skill, :skill_name => "Javascript")
        FactoryGirl.create(:required_skill, :skill_name => "CSS")
        FactoryGirl.create(:required_skill, :skill_name => "Ruby")
        FactoryGirl.create(:required_skill, :skill_name => "Sinatra")
        FactoryGirl.create(:required_skill, :skill_name => "PHP")
        FactoryGirl.create(:required_skill, :skill_name => "Django")
        FactoryGirl.create(:required_skill, :skill_name => "MySql")
      end

      if Job.count.zero?
        FactoryGirl.create(:job, :full_time=>true, :title=> "MySql Pro",             :company =>  company,  :extra_skill => "Full time job")
        FactoryGirl.create(:job, :part_time=>true, :title=> "Rails Lover",           :company =>  company,  :extra_skill => "Part time job")
        FactoryGirl.create(:job, :remote=>true,    :title=> "Front end expert",      :company =>  company,  :extra_skill => "Remote job")
        FactoryGirl.create(:job, :flexible=>true,  :title=> "Excelente programador", :company =>  company2, :extra_skill => "Flexible job")
        FactoryGirl.create(:job, :full_time=>true, :title=> "API Developer",         :company =>  company2, :extra_skill => "Full time job")
        FactoryGirl.create(:job, :flexible=>true,  :title=> "Rails Ninja",           :company =>  company2, :extra_skill => "Flexible job")
        FactoryGirl.create(:job, :part_time=>true, :title=> "Web app developer",     :company =>  company,  :extra_skill => "Part time job")
        FactoryGirl.create(:job, :remote=>true,    :title=> "Software engineer",     :company =>  company2, :extra_skill => "Remote job")
      end
    end
  end
end

