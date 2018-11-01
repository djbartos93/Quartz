class UsersController < ApplicationController
  def disable_otp
    current_user.otp_required_for_login = false
    current_user.save!
    redirect_back(fallback_location: '/')
  end

  def enable_otp
    current_user.otp_secret = User.generate_otp_secret
    current_user.otp_required_for_login = true
    current_user.save!
    redirect_back(fallback_location: '/')
  end

  def update
  @user = User.find(params[:id])
  params[:user].delete(:password) if params[:user][:password].blank?
  params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

  if @user.update(user_params)
    flash[:notice] = "Successfully updated User."
    redirect_to root_path
    else
      render :action => 'edit'
    end
  end


  private

  def user_params
     params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
