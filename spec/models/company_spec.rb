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
    
    describe '.facebook?' do
      context 'With facebook page' do
        it 'Returns true' do
          @company.update_attribute('facebook', 'foobar')
          @company.facebook?.should be_true
        end

      end

      context 'Without facebook page' do
        it 'Returns false' do
          @company.update_attribute('facebook', nil)
          @company.facebook?.should be_false
        end
      end
    end

    describe '.website?' do
      context 'With website page' do
        it 'Returns true' do
          @company.update_attribute('website', 'foobar')
          @company.website?.should be_true
        end

      end

      context 'Without website page' do
        it 'Returns false' do
          @company.update_attribute('website', nil)
          @company.website?.should be_false
        end
      end
    end

    describe '.twitter?' do
      context 'With twitter page' do
        it 'Returns true' do
          @company.update_attribute('twitter', 'foobar')
          @company.twitter?.should be_true
        end

      end

      context 'Without twitter page' do
        it 'Returns false' do
          @company.update_attribute('twitter', nil)
          @company.twitter?.should be_false
        end
      end
    end
    
    describe '.contact_email' do
      context 'With contact_email page' do
        it 'Returns true' do
          @company.update_attribute('contact_email', 'foobar')
          @company.contact_email?.should be_true
        end

      end

      context 'Without contact_email page' do
        it 'Returns false' do
          @company.update_attribute('contact_email', nil)
          @company.contact_email?.should be_false
        end
      end
    end

    describe '.phone1?' do
      context 'With phone1 page' do
        it 'Returns true' do
          @company.update_attribute('phone1', 'foobar')
          @company.phone1?.should be_true
        end

      end

      context 'Without phone1 page' do
        it 'Returns false' do
          @company.update_attribute('phone1', nil)
          @company.phone1?.should be_false
        end
      end
    end


    describe 'logo_url' do
        pending
    end
  end
end
