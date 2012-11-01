FactoryGirl.define do
  factory :company do
    sequence(:email) {|n| "member#{n}@mycompany.com" }
    sequence(:title) {|n| "My Company#{n}" }
    city                  "Monterrey"
    password              "secret"
    password_confirmation "secret"
    description           "This is my company"
    role                  "member"
    website               "www.foobar.com"
    facebook              "foobar"
    twitter               "foobar"
    contact_email         "foo@bar.com"
  end

  factory :job do
    title                 "Ruby Programmer"
    city                  "Monterrey"
    full_time             true
    part_time             false
    remote                false
    flexible              false
    extra_skill           ""
    description           "We required 3 ruby programmers"
    association           :company, :factory => :company
  end

  factory :required_skill do
    sequence(:skill_name) { |n| "Ruby#{n}" }
  end

  factory :job_for_seed do
    title                 "Ruby Programmer"
    city                  "Monterrey"
    full_time             false
    part_time             false
    remote                false
    flexible              false
    description           "Faltan required skills!"
    association           :company, :factory => :company
  end
end
