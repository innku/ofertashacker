require 'spec_helper'

describe User do
  before do
    @user = Factory(:user, :email => "user@sample.com")
  end

  context 'Validations' do
    context 'User is valid' do
        it 'With all attributes' do
          @user.should be_valid
        end
        it 'With a matching password and confirmation password' do
          @user.password = "secret"
          @user.password_confirmation = "secret"
          @user.should be_valid
        end
    end

    context 'User is not valid' do

      it 'Without an email' do
        @user.email = nil
        @user.should_not be_valid
      end

      it 'Without a name' do
        @user.name = nil
        @user.should_not be_valid
      end
      
      it 'Without a password' do
        @user.password = nil
        @user.should_not be_valid
      end

      it 'Without a password confirmation' do
        @user.password_confirmation = nil
        @user.should_not be_valid
      end

      it 'Without a message' do
        @user.message = nil
        @user.should_not be_valid
      end

      it 'With an unmatching password and confirmation password' do
        @user.password = 'secret'
        @user.password_confirmation = 'not-secret'
        @user.should_not be_valid
      end
    end
  end
end
