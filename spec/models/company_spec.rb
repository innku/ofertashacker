require 'spec_helper'

describe Company do

  before(:each) do
    @company = Factory(:company)
  end
  
  context 'Validations' do
    context 'Company is valid' do
      it "With all attributes" do
        @company.should be_valid
      end
    end

    context 'Company is not valid' do
      it "Without title" do
        @company.title=nil
        @company.should_not be_valid
      end

      it 'Without an emal' do
        @company.email = nil
        @company.should_not be_valid
      end 

    end
  end
  
  context 'Instance methods' do
    
    describe '.admin?' do

      context 'When comany role is admin' do
        before do
          @company.role = 'admin'
          @company.save

        end
        it 'Returns true' do
          @company.admin?.should be_true
        end
      end

      context 'When company role is not admin' do
        before do
          @company.role = 'not-admin'
          @company.save

        end
        it 'Returns false' do
          @company.admin?.should be_false
        end
      end
    end
    
    describe '.member?' do
      context 'When comany role is member' do
        before do
          @company.role = 'member'
          @company.save

        end
        it 'Returns true' do
          @company.member?.should be_true
        end
      end
      context 'When company role is not member' do
        before do
          @company.role = 'not-member'
          @company.save

        end
        it 'Returns false' do
          @company.member?.should be_false
        end
      end
    end

    describe 'logo_url' do
        pending
    end
  end
end
