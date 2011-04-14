Rubypros::Application.routes.draw do

  root :to => 'welcome#index'

  metropoli_for :cities, :states, :countries

  devise_for :companies
  
  resources :companies do
    member do
      get "my_jobs"
    end
  end
  
  resources :jobs 
  resources :required_skills
  
  match 'jobs/see/:id' => 'jobs#show'
  
  match 'about'=>'welcome#about', :as=>:about
  match 'contact'=>'welcome#contact', :as=>:contact
 
end
