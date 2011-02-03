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
    classes
  end
end
