Rails.application.routes.draw do


  root to: 'staticpages#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :staticpages
  match '/home', to: 'staticpages#home', via: [:get]
  match '/about', to: 'staticpages#abouttheclub', via: [:get]
  match '/join', to: 'staticpages#howtojoin', via: [:get]
  match '/equipment', to: 'staticpages#whatyouneed', via: [:get]
  match '/clubmatters', to: 'staticpages#clubmatters', via: [:get]
  match '/location', to: 'staticpages#howtogetthere', via: [:get]
  match '/links', to: 'staticpages#croquetlinks', via: [:get]
  
  resources :events
  match 'events', to: 'events#index', via: [:get]

  resources :newsletters
  match 'newsletters', to: 'newsletter#index', via: [:get]
  
  
  resources :lawn_bookings
  match '/lawn_bookings', to: 'lawn_bookings#index', via: [:get]
  match '/book_lawn', to: 'lawn_bookings#book_lawn', via: [:post]
  match '/bookings_sse', to: 'lawn_bookings#bookings_sse', via: [:get]
  
end
