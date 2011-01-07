module JobsHelper
  
  def get_job_type(job)
    
    content = "".html_safe
    job_options = []
    
    if job.full_time
      job_options << t('.full_time')
    end
    if job.part_time
      job_options << t('.part_time')
    end
    if job.remote
      job_options << t('.remote')
    end
    if job.flexible
      job_options << t('.flexible')
    end
    
    content += content_tag(:p, job_options.join(", "))
    
  end
end
