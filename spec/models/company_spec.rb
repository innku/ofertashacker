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
      
      context 'When there is a website' do
        it 'With a valid website format' do
          @company.website = "www.website.com"
          @company.should be_valid
        end
      end
      
    end
      
    context 'Company is not valid' do
      it "Without title" do
        @company.title=nil
        @company.should_not be_valid
      end

      it 'Without an email' do
        @company.email = nil
        @company.should_not be_valid
      end 
      
      context 'When there is a website' do
        it 'With an invalid website format' do
          @company.website = "sn.sb.sdn.com"
          @company.should_not be_valid
        end
          
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
      context 'When company role is member' do
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
    
    describe '.logo_url' do
        context 'When environment is production' do
          before do
            Rails.stub(:env).and_return("production")
            @company.stub_chain(:logo, :url).and_return('www.a-website.com/image.jpg')
          end          
          it 'Returns the logo url' do
            @company.logo_url.should eql('www.a-website.com/image.jpg')
          end
        end
        
        context 'When environment is not production' do
          
          context 'When there is no logo uploaded' do
            it 'Returns the default logo route' do
              @company.logo_url.should eql(Company::DEFAULT_LOGO_ROUTE)
            end
          end
          
          context 'When there is a logo uploaded' do
            before do
              @company.stub_chain(:logo, :path).and_return('public/the/path/image.jpg')
            end
            it 'Returns the logo path without the /public' do
              @company.logo_url.should eql('/the/path/image.jpg')
            end
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

    describe '.latests_jobs' do 
      context 'When company has no jobs' do
        it 'Returns an empty array' do
          @company.latests_jobs.should be_blank
        end
      end
      
      context 'When company has jobs' do
        before do
          5.times { Factory(:job, :company => @company) }
          @jobs = Job.ordered[0..3]
          @job = Job.first
        end
        
        it 'Returns the four latests jobs' do
          @company.latests_jobs.should eql(@jobs) 
        end
        
        it 'Does not return older jobs' do
          @company.latests_jobs.should_not include(@job)
        end
      end
      
    end
  end
end
