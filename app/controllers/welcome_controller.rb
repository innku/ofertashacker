class WelcomeController < ApplicationController
  
  def index
    @jobs = Job.all :limit=>4
  end
  def about
  end
  def contact
  end

end
