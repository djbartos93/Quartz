Rails.application.routes.draw do
  devise_for :users
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'players#index'

  get 'discourse/sso' => 'discourse_sso#sso'

end
