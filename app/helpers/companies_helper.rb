module CompaniesHelper
  
  def prepend_facebook(page)
    "http://www.facebook.com/#{page}"
  end
  
  def prepend_twitter(page)
    "http://www.twitter.com/#{page}"
  end
  
  def prepend_http(page)
    "http://#{page}"
  end
    
end
