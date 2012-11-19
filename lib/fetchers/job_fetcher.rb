module Fetchers
  class JobFetcher
    def self.search(params)
      jobs = Job.filter_it(params[:filters]).order("RANDOM()")
      if params[:jobs_ids] 
        jobs = jobs.no_repeat(params[:jobs_ids]) 
      end
      if params[:location_type].present? 
        jobs = from_location(jobs, params[:location_id], params[:location_type])
      end
      jobs.limit(8)
    end

    private

    def self.from_location(jobs, id, type)
      jobs.send("from_#{type}", id)
    end
  end
end
