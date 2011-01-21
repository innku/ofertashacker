module ApplicationHelper
  def custom_title page_title
    @content_for_title = page_title + " - " 
  end
  
end
