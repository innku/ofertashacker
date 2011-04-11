Factory.define :company do |f|
  f.sequence(:email) {|n| "memver#{n}@mycompany.com" }
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
  f.description           "We required 3 ruby programmers"
  f.association           :company, :factory => :company
end

Factory.define :required_skill do |rs|
  rs.skill_name           "Ruby"
  rs.skill_category_id    1
end


Factory.define :skill_category do |c|
  c.category              "Ruby"
end

