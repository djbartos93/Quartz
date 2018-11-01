class Admin::UserAdminsController < Comfy::Admin::BaseController


  #get /admin/user_admins/
  def index
    @users = User.all
  end

  #get /admin/user_admins/1/
  # doesnt actually work, does it need to?
  def show
  end

  #get /admin/user_admins/1/edit
  # link_to 'Edit', edit_admin_user_admin_path(user) <- best thing ever.
  #TODO make sure other users cant get at this path.
  def edit
  @user = User.find(params[:id])

  #this works, but we can do better.
  authorize! :edit, @user
  end

  ##TODO actually make this work right.
  def pw_admin
    @user = User.find(params[:id])
    new_password = Devise.friendly_token(50)
    user.reset_password(new_password, new_password)
    user.send_rest_password_instructions
  end
end
