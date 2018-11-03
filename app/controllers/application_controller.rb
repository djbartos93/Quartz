class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  #this is what throws an error if you are not allowed to access a page. but right now it just tells you that you are logged in.
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => exception.message }
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.sign_in_count == 1
      player = Player.find_by user_id: resource.id
      return edit_player_path(player)
    else
      super
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
  end

end
