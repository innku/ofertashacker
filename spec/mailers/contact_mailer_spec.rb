#encoding: utf-8;

require "spec_helper"

describe ContactMailer do

  describe '.contact' do

    before do
      @job = Factory(:job)
      @name = "User name"
      @email = "user@email.com"
      @message = "The message"
      @mail = ContactMailer.contact(@job, @name, @email, @message)
    end

    it 'Should be sent to the job\'s company' do
      @mail.to.should eql([@email])
    end
    it 'Should be sent by ofertas hacker' do
      @mail.from.should eql(["OfertasHacker@ofertashacker.com"])
    end

    it 'Should send the correct subject' do
      @mail.subject.should eql("User name está interesado(a) en tu vacante")
    end
  end
end
