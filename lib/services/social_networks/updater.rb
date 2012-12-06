module Services
  module SocialNetworks
    class Updater

      attr_reader :company_title, :job_id, :job_title

      def initialize(company_title, job_id, job_title)
        @company_title = company_title
        @job_id = job_id
        @job_title = job_title
      end

      def post_all
        Tweet.deliver(generate_message, url)
        FbWallPost.deliver(generate_message, url)
      end

      def generate_message
        "#{company_title}: #{job_title}"
      end

      def url
        $bitly.shorten("http://www.ofertashacker.com/jobs/#{job_id}").short_url
      end

    end
  end
end
