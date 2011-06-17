class UsersController < ApplicationController
  def contact_company
    @user = current_user
    @user.message = params[:user][:message]
    @job = Job.find(params[:job])
    ContactMailer.contact(job, @user).deliver if @user
    redirect_to @job
  end

  def edit
    @user = current_user 
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
end
