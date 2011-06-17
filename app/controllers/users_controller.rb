class UsersController < ApplicationController
  def contact_company
    @user = current_user
    @user.message = params[:user][:message]
    @job = Job.find(params[:job])
    ContactMailer.contact(@job, @user).deliver if @user
    redirect_to @job, :notice => t('.)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
end
