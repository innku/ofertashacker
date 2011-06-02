class UsersController < ApplicationController
  def contact_company
    user = current_user
    user.message = params[:user][:message]
    job = Job.find(params[:job])
    ContactMailer.contact(job, user).deliver if user
    redirect_to job
  end
end
