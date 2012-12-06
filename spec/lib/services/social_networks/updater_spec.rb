require 'services/social_networks/updater'
require 'services/social_networks/tweet'
require 'services/social_networks/fb_wall_post'

describe 'Updater' do

  describe 'generate_message' do
    it 'returns the company title plus the job title' do
      Services::SocialNetworks::Updater.new('JP Company', '123', 'Super Job').generate_message == "JP Company: Super Job"
    end
  end

  describe 'post_all' do
    it 'delivers the message and url to all the social networks' do
      short_url = stub(short_url: 'http://bit.ly/123/')
      $bitly = stub(shorten: short_url)
      Services::SocialNetworks::Tweet.should_receive(:deliver).with("JP Company: Super Job", 'http://bit.ly/123/')
      Services::SocialNetworks::FbWallPost.should_receive(:deliver).with("JP Company: Super Job", 'http://bit.ly/123/')
      Services::SocialNetworks::Updater.new("JP Company", "123", "Super Job").post_all
    end
  end

end
