module Services
  module SocialNetworks
    class FbWallPost

      def self.deliver(message, url)
        page_graph = Koala::Facebook::API.new(APP_CONFIG[:oh_page_token])
        begin
          page_graph.put_wall_post("#{message} #{url}") 
        rescue Exception => e
          puts e
        end
      end

    end
  end
end
