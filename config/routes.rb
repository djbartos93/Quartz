Rails.application.routes.draw do
  comfy_route :cms_admin, path: "/admin"
  # Ensure that this route is defined last
  comfy_route :cms, path: "/cms"
  devise_for :users
  resources :players
  resources :invites
  resources :dashboard
  resources :request
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  get 'discourse/sso' => 'discourse_sso#sso'

  get 'validate', to: 'players#validate'

  get ':token', to: 'registrations#new', constraints: lambda { |request| Invite.where(token: request[:token]).any? }
end
