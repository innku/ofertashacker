Rubypros::Application.routes.draw do

  root :to => 'jobs#index'

  metropoli_for :cities, :states, :countries

  devise_for :companies
  
  resources :companies do
    member do
      get "my_jobs"
    end
  end
  
  resources :jobs 
  resources :required_skills
  
  match '/terminos' => 'welcome#terminos'
  match '/privacidad' => 'welcome#privacidad'
  
  match 'about'=>'welcome#about', :as=>:about
 
end
