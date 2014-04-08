module Fetchers
  class JobFetcher
    def self.search(params)
      jobs = Job.not_expired.filter_it(params[:filters])
      if params[:location_type].present? 
        jobs = from_location(jobs, params[:location_id], params[:location_type])
      end
      if params[:keywords].present? 
        jobs = jobs.with_keywords(params[:keywords]) 
      end
      if params[:last_date].present?
        jobs.next_jobs_batch(20, params[:last_date])
      else
        jobs.next_jobs_batch(20)
      end
    end

    private

    def self.from_location(jobs, id, type)
      jobs.send("from_#{type}", id)
    end
  end
end
