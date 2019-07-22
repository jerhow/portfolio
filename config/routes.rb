Rails.application.routes.draw do
  root to: 'pages#home'

  resources :portfolio_items, except: [:show]
  get 'portfolio/:id', to: 'portfolio_items#show', as: 'portfolio_show'
  # ^^ In this way we can override the default resources value,
  # and also add our own custom route method (the last param, as: 'portfolio_show')

  
  get 'angular-items', to: 'portfolio_items#angular'


  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do
    member do
      get :toggle_status
      # ^^ Exposing this route as a GET is a bad idea, as this modifies data.
      # Jordan said he was going to update this in the lesson, but I don't think that has happened.
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
