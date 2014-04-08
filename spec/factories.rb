#encoding: utf-8
FactoryGirl.define do
  factory :company do
    sequence(:email) {|n| "member#{n}@mycompany.com" }
    sequence(:title) {|n| "My Company#{n}" }
    password              "secret"
    password_confirmation "secret"
    description           "This is my company"
    role                  "member"
    website               "www.foobar.com"
    facebook              "foobar"
    twitter               "foobar"
    contact_email         "foo@bar.com"
    city
  end

  factory :job do
    title                 "Ruby Programmer"
    full_time             true
    part_time             false
    remote                false
    flexible              false
    extra_skill           ""
    description           "We required 3 ruby programmers"
    expiration_date       60.days.from_now
    association           :company, :factory => :company
    city
    association           :country, :factory => :country
  end

  factory :required_skill do
    sequence(:skill_name) { |n| "Ruby#{n}" }
  end

  factory :job_for_seed do
    title                 "Ruby Programmer"
    full_time             false
    part_time             false
    remote                false
    flexible              false
    description           "Faltan required skills!"
    association           :company, :factory => :company
    city
  end

  factory :city, class: Metropoli::CityModel do
    sequence(:name) { |n| "Monterrey#{n}" }
    association           :state
  end

  factory :state, class: Metropoli::StateModel do
    name      "Nuevo León"
    abbr      "NL"
    association           :country
  end

  factory :country, class: Metropoli::CountryModel do
    name      "México"
    abbr      "MX"
  end

end
