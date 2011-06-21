class UsersController < ApplicationController
  def contact_company
    @user = current_user
    @user.message = params[:user][:message]
    @job = Job.find(params[:job])
    ContactMailer.contact(@job, @user).deliver if @user
    redirect_to @job, :notice => t('.')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @job = Job.find(params[:job])
    @user = User.find(params[:id])
    @user.message = "default"
    if @user.update_attributes(params[:user])
      redirect_to job_path(@job, :open_lightbox => true)
    else
      @user.message = ""
      render :template=>'jobs/show'
    end
  end
end
