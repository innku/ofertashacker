class WelcomeController < ApplicationController
  def index
    @jobs = Job.all
    
  end

end
