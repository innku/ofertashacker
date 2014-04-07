#encoding: utf-8;

require "spec_helper"

describe OfferMailer do
  describe '.notificate_expiration' do
    before do
      @company = FactoryGirl.create(:company, :email => "company@mail.com")
      @job = FactoryGirl.create(:job, :company => @company)
      @mail = OfferMailer.notificate_expiration(@job)
    end

    it "should be sent to the job\'s company" do
      @mail.to.should eql([@company.email])
    end

    it 'Should be sent by ofertas hacker' do
      @mail.from.should eql(["OfertasHacker@ofertashacker.com"])
    end

    it "should have the right subject" do
      @mail.subject.should eql("Expiración de la vacante: #{@job.title}")
    end

    it "should have the right content" do
      @mail.body.raw_source.should include "#{@job.title}"
      @mail.body.raw_source.should include "expirará dentro de 60 días"
    end
  end
end