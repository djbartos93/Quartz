class Admin::UserAdminsController < Comfy::Admin::BaseController
  def index
    @users = User.all
  end

  def show
  end

  def edit
  @user = User.find(params[:id])
  end
end
