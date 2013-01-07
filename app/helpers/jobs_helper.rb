module JobsHelper

  def installed_countries_with_cities
    CountryModelDecorator.with_cities.extract_names
  end

  def get_job_type(job, text_only=false)
    
    content = "".html_safe
    job_options = []
    
    job.full_time ? job_options << "Tiempo completo" : ""
    job.part_time ? job_options << "Medio Tiempo" : ""
    job.remote ? job_options << "Remoto" : ""
    job.flexible ? job_options << "Flexible" : ""
    
    if text_only
      content +=job_options.join(", ")
    else
      content += content_tag(:p, job_options.join(", "))
    end
  end
  
  def display_segmented_list(job_list,even_or_odd='even')
    if block_given?
      job_list.each_with_index do |job, index|
        if index.send "#{even_or_odd}?"
           yield(job)
        end
      end
    end
  end
  
  def job_info(job)
    str=""
    job.city ? str+=" En #{job.city} " : ""
    str+=get_job_type(job,true)
    str
  end

  def condensed_information(job)
    str=""
    job.company ? str+=job.company.title : ""
    job.origin ? str+=" en #{job.origin} " : ""
    str+=get_job_type(job,true)
    str
    
  end
  
  def location_info_for(job)
    {:city_name => job.city_name.to_s, :country_name => job.country_name.to_s }.to_json.html_safe
  end
end
