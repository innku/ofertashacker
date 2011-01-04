Factory.define :company do |f|
  f.title "My Company"
  f.city "Monterrey"
  f.sequence(:email) {|n| "superuser#{n}@mycompany.com" }
  f.password "justme"
  f.password_confirmation "justme"
  f.description "This is my company"
  f.role "member"
end