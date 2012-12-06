module Services
  module SocialNetworks
    class Tweet

      def self.deliver(message, url)
        tweet_message = message.slice 0..115
        Twitter.update "#{tweet_message} #{url}"
      end

    end
  end
end
