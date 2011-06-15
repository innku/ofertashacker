# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110615205939) do

  create_table "cities", :force => true do |t|
    t.integer "state_id"
    t.string  "name"
  end

  add_index "cities", ["name"], :name => "index_cities_on_name"
  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "companies", :force => true do |t|
    t.string   "email",                               :default => "",       :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",       :null => false
    t.string   "password_salt",                       :default => "",       :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "title"
    t.string   "city"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "role",                                :default => "member"
    t.integer  "city_id"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "contact_email"
    t.string   "website"
  end

  add_index "companies", ["city"], :name => "index_companies_on_city"
  add_index "companies", ["city_id"], :name => "index_companies_on_city_id"
  add_index "companies", ["email"], :name => "index_companies_on_email", :unique => true
  add_index "companies", ["reset_password_token"], :name => "index_companies_on_reset_password_token", :unique => true
  add_index "companies", ["title"], :name => "index_companies_on_title", :unique => true

  create_table "countries", :force => true do |t|
    t.string "name"
    t.string "abbr"
  end

  add_index "countries", ["abbr"], :name => "index_countries_on_abbr"
  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "jobs", :force => true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.string   "state"
    t.boolean  "full_time",   :default => false
    t.boolean  "part_time",   :default => false
    t.boolean  "remote",      :default => false
    t.boolean  "flexible",    :default => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.string   "city"
    t.integer  "city_id"
    t.text     "extra_skill"
  end

  add_index "jobs", ["city_id"], :name => "index_jobs_on_city_id"
  add_index "jobs", ["state"], :name => "index_jobs_on_state"
  add_index "jobs", ["state_id"], :name => "index_jobs_on_state_id"
  add_index "jobs", ["title"], :name => "index_jobs_on_title"

  create_table "jobs_required_skills", :id => false, :force => true do |t|
    t.integer "job_id"
    t.integer "required_skill_id"
  end

  add_index "jobs_required_skills", ["job_id", "required_skill_id"], :name => "index_jobs_required_skills_on_job_id_and_required_skill_id"

  create_table "required_skills", :force => true do |t|
    t.string   "skill_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "required_skills", ["skill_name"], :name => "index_required_skills_on_skill_name", :unique => true

  create_table "states", :force => true do |t|
    t.integer "country_id"
    t.string  "name"
    t.string  "abbr"
  end

  add_index "states", ["abbr"], :name => "index_states_on_abbr"
  add_index "states", ["country_id"], :name => "index_states_on_country_id"
  add_index "states", ["name"], :name => "index_states_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "github_url"
    t.string   "linkedin_url"
    t.string   "personal_url"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
