Factory.define :company do |f|
  f.sequence(:email) {|n| "member#{n}@mycompany.com" }
  f.title                 "My Company"
  f.city                  "Monterrey"
  f.password              "secret"
  f.password_confirmation "secret"
  f.description           "This is my company"
  f.role                  "member"
  f.website               "www.foobar.com"
  f.facebook              "foobar"
  f.twitter               "foobar"
  f.contact_email         "foo@bar.com"
end

Factory.define :job do |f|
  f.title                 "Ruby Programmer"
  f.city                  "Monterrey"
  f.full_time             true
  f.part_time             false
  f.remote                false
  f.flexible              false
  f.extra_skill           ""
  f.description           "We required 3 ruby programmers"
  f.association           :company, :factory => :company
end

Factory.define :required_skill do |rs|
  rs.sequence(:skill_name) { |n| "Ruby#{n}" }
end

Factory.define :job_for_seed, :class => Job do |j|
  j.title                 "Ruby Programmer"
  j.city                  "Monterrey"
  j.full_time             false
  j.part_time             false
  j.remote                false
  j.flexible              false
  j.description           "Faltan required skills!"
  j.association           :company, :factory => :company
  # j.required_skills {|rs|[rs.association :required_skill]}
end

