Factory.define :company do |f|
  f.title "My Company"
  f.city "Monterrey"
  f.sequence(:email) {|n| "memver#{n}@mycompany.com" }
  f.password "justme"
  f.password_confirmation "justme"
  f.description "This is my company"
  f.role "member"
end

Factory.define :job do |f|
  f.title "Ruby Programmer"
  f.city "Monterrey"
  f.full_time true
  f.part_time false
  f.remote true
  f.flexible false
  f.description "We required 3 ruby programmers"
  f.association :company, :factory => :company
end

Factory.define :required_skill do |rs|
  rs.skill_name "Ruby"
  rs.skill_category_id 1
end


Factory.define :skill_category do |c|
  c.category "Ruby"
end

