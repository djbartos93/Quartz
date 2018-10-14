class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      player = Player.find_by user_id: resource.id
      return edit_player_path(player)
    else
      super
    end
  end
end
