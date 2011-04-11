module ApplicationHelper

  
  def custom_title page_title
    @content_for_title = page_title + " - " 
  end
  
  def addclass job
    
    classes=""
    job.full_time ? classes+=" full_time" : ""
    job.part_time ? classes+=" part_time" : ""
    job.remote ? classes+=" remote" : ""
    job.flexible ? classes+=" flexible" : ""
    
    rs=RequiredSkill.all
    for skill in rs do
       if job.required_skill_ids.include? skill.id 
          classes+= " rs#{skill.id}"
      end
    end
    classes.strip
  end
  
  def check_path_for path
    exceptions = ["/jobs","/",'edit','jobs/new','jobs/new','skill_categories/new',"companies","sign_up", "sign_in", "my_jobs"]
    for e in exceptions do 
       if path.to_s == e or path.to_s.ends_with?(e)
         return false
       end
    end
    regex = [/companies\/\d+/]
    for r in regex do
      unless r.match(path.to_s).nil?
        return false
      end
    end
    return true

  end
  def needs_filter? path
    exceptions = ["/jobs","/"]
    for e in exceptions do 
       return false if path.to_s == e
    end
    return true
  end
  
end
