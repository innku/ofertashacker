require 'spec_helper'

describe MyDevise::RegistrationsController do
  include Devise::TestHelpers
  include Rack::Recaptcha::Helpers

  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe '#create' do
    context 'With a valid captcha' do
      before do
        controller.stub(:recaptcha_valid?).and_return(true)
      end
      context 'When the user wants to register' do
        context 'With valid parameters' do
          before do
            @job = Factory(:job)
          end
          let(:valid_params){{:job => @job.id, 
                              :user=> Factory.build(:user).attributes.merge!({:password => 'secret', 
                                                                              :password_confirmation => 'secret', 
                                                                              :message => "The Message"}),
                              :register=>true}}

          it 'Saves the user' do
            lambda { post :create, valid_params}.should change(User, :count).by(1)
          end

          it 'Sends the contact email to the job\'s company'

          it 'Renders a flash notice for success' do
            post :create, valid_params
            flash[:notice].should_not be_blank
          end

          it 'Signs the user in' do
            post :create, valid_params
            warden.authenticated?(:user).should eql(true)
          end

          it 'Redirects to root path' do
            post :create, valid_params
            response.should redirect_to(root_path)
          end
        end
        
        context 'With invalid parameters' do


        end

      end
      context 'When the user does not want to register' do

      end

    end
    context 'With an invalid captcha' do

    end
  end
end
