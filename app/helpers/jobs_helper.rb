module JobsHelper
  def meta_title_for job
    "#{job.title} en #{job.company.title}"
  end

  def meta_description_for job
    result = "#{job.company.title} esta en busca de un #{job.title} en #{job.origin}. "
    if job.required_skills.any?
      result += "Algunas habilidades requeridas son #{job.required_skills.map(&:skill_name).to_sentence}. "
    end
    result += "Conoce mas acerca de esta oferta de trabajo en Ofertas Hacker"
    result
  end

  def meta_image_for job
    "https://image.ibb.co/moNZrF/oh_logo.png"
  end

  def installed_countries_names_with_cities
    CountryModelDecorator.names_of_countries_with_cities
  end

  def installed_countries_abbreviations
    CountryModelDecorator.abbr_of_countries_with_cities.map(&:downcase)
  end

  def country_image(abbr)
    "<img alt='#{abbr}_flag'  src='/#{abbr}.png'/>".html_safe
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
  
  def expired?(job)
    job.expiration_date < DateTime.now
  end

  def location_info_for(job)
    {:city_name => job.city_name.to_s, :country_name => job.country_name.to_s }.to_json.html_safe
  end
end
