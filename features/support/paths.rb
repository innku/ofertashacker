module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /^the new job page$/i
      new_job_path()
      
    when /^the required skill index page$/i
      required_skills_path()  
    when /^the index job page$/i
      jobs_path()
    when /^the show job page for "(.*)"$/i
      job = Job.find_by_title($1)
      job_path(job)
    when /^the edit job page for "(.*)"$/i
      job = Job.find_by_title($1)
      edit_job_path(job)
    when /^the edit required skill page for "(.*)"$/i
      rs = RequiredSkill.find_by_skill_name($1)
      edit_required_skill_path(rs)
    when /^the new company page$/i
      new_company_registration_path()
    when /^my jobs page for "(.*)"$/i
      company = Company.find_by_email($1)
      my_jobs_company_path(company)
    when /^the company index$/i
      companies_path()
    when /^the edit company page for "(.*)"$/i
      company = Company.find_by_email($1)
      edit_company_path(company)
    when /^the show company page for "(.*)"$/i
      company = Company.find_by_email($1)
      company_path(company)
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
