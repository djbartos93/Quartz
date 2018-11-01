Rails.application.routes.draw do
  namespace :admin do
    resources :user_admins
  end

  comfy_route :blog_admin, path: "/admin"
  comfy_route :blog, path: "/blog"
  comfy_route :cms_admin, path: "/admin"

  post 'users/enable_otp'
  post 'users/disable_otp'

  devise_for :users
    scope "/admin/user_admins/uses" do
      resources :users
    end

  resources :players
  resources :invites
  resources :dashboard
  resources :request
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'comfy/cms/content#show'

  get 'discourse/sso' => 'discourse_sso#sso'

  get 'validate', to: 'players#validate'

  get ':token', to: 'registrations#new', constraints: lambda { |request| Invite.where(token: request[:token]).any? }

  #get '/', to: '/demo'
  # Ensure that this route is defined last
  comfy_route :cms, path: "/"
end
