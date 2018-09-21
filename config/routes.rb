Rails.application.routes.draw do
  root to: "works#index"

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }

  resources :users, except: [:index]

  resources :works

end
