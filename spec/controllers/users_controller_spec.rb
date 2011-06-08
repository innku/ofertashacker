require 'spec_helper'

describe UsersController do
  include Devise::TestHelpers

  before do
    @user = Factory(:user)
    sign_in @user
  end

  describe '#contact_company' do

    context 'With valid params' do
      before do
        @job = Factory(:job)
      end
      let(:valid_params){{:user => {:message => "The message"}, :job => @job.id}}

      context 'With a signed in user' do

        it 'Gets the user' do
          post :contact_company, valid_params
          assigns(:user).should eql(@user)
        end
        
        it 'Sets the message to the user' do
          post :contact_company, valid_params
          assigns(:user).message.should eql("The message")
        end

        it 'Gets the job' do
          post :contact_company, valid_params
          assigns(:job).should eql(@job)
        end

        it 'Sends a mail to the company related with the job'

      end

      context 'Without a signed in user' do
        before do
          sign_out @user
        end


        it 'Does not send an mail to the company related with the job' do
        end
      end

      it 'Redirects to the job path' do
        post :contact_company, valid_params
        response.should redirect_to(job_path @job)
      end

    end
    context 'With invalid params' do

      let(:invalid_params){{:user => {:message => "The message"}, :job => @job.id}}

      it 'Does not get the user' do
        post :contact_company, invalid_params
        assigns(:user).should be_blank
      end
      it 'Does not get the job' do
        post :contact_company, invalid_params
        assigns(:job).should be_blank

      end
      it 'It raises an error' do
        lambda { post :contact_company, invalid_params }.should raise_error
      end
    end
  end

end
