Gurke::Application.routes.draw do
  match 'account/edit' => 'accounts#edit', :as => :edit_current_account

  match 'signup' => 'accounts#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  resources :gardens do
    resources :beds do
      put :move_bed, :on => :member
      get :add_plants, :on => :member
      put :update_add_plants, :on => :member
    end
    resources :tasks
  end

  resources :sessions

  resources :accounts

  resources :families

  resources :plants
  root :to => 'home#index'
  match 'plants/:id/calculate_harvest_time' => 'plants#calculate_harvest_time'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
