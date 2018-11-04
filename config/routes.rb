Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  namespace :admin do
    resources :user_admins
  end

  comfy_route :blog_admin, path: "/admin"
  comfy_route :blog, path: "/blog"
  comfy_route :cms_admin, path: "/admin"

  post 'users/enable_otp'
  post 'users/disable_otp'

  post 'users/:id/enable_otp/' => 'users#admin_enable_otp', as: 'admin_enable_otp'
    post 'users/:id/disable_otp/' => 'users#admin_disable_otp', as: 'admin_disable_otp'

  post 'users/:id/reactivate_user/' => 'users#admin_reactivate', as: 'admin_reactivate_user'

    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
    scope "admin/user_admins/users" do
      resources :users
    end
    devise_scope :user do
      scope :users, as: :users do
        post 'pre_otp', to: 'users/sessions#pre_otp'
      end
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
