Rubypros::Application.routes.draw do

  root :to => 'welcome#index'

  metropoli_for :cities, :states, :countries

  devise_for :companies
  
  resources :companies
  resources :jobs 
  
  resources :skill_categories do
    resources :required_skills
  end
  
  match 'jobs/see/:id' => 'jobs#show'
  
  match 'available'=>'jobs#available', :as=>:available
 
end
