class Admin::UserAdminsController < Comfy::Admin::BaseController
  def index
    @users = User.all
  end
end
