class RegistrationsController < Devise::RegistrationsController
  def devise_mapping
    Devise.mappings[:user]
  end
end
