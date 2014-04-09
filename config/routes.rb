Rubypros::Application.routes.draw do

  root :to => 'jobs#index'

  metropoli_for :cities, :states, :countries, :cities_and_countries

  devise_for :companies, 
    :path_names => {
    :sign_in  => 'entrar',
    :sign_up  => 'registro',
    :sign_out => 'salir' 
  }

  resources :companies do
    member do
      get "my_jobs"
    end
  end
  resources :jobs do
    member do
      post "contact_company"
      get "expire"
    end
  end

  resources :required_skills

  match '/terminos' => 'welcome#terminos'
  match '/privacidad' => 'welcome#privacidad'
  match '/ofertas' => 'jobs#index'
  match '/empresas' => 'companies#index'
  match '/registro' => 'devise#new'
  match '/nueva_oferta' => 'jobs#new'
  match '/busqueda' => 'jobs#search', :as => 'job_search'

  match '/acerca_de'=>'welcome#about'
  match '/codigo'=>'welcome#codigo'
  match '/licencia'=>'welcome#licencia'
  match '/:country'=>'redirecter#check_valid_country', as: 'country_jobs'

end
