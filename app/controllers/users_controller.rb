class UsersController < ApplicationController

  #disable OTP for the current user only
  def disable_otp
    current_user.otp_required_for_login = false
    current_user.save!
    redirect_back(fallback_location: '/')
  end

  #enable OTP for the current user only
  def enable_otp
    current_user.otp_secret = User.generate_otp_secret
    current_user.otp_required_for_login = true
    current_user.save!
    redirect_back(fallback_location: '/')
  end

  #this is for future use
  #POST /users/:id/enable_otp
  def admin_enable_otp
    user = User.find(params[:id])
    authorize! :edit, @user #prevent other users from enabling OTP on another user.
    user.otp_secret = User.generate_otp_secret
    user.otp_required_for_login = true
    user.save!
    redirect_back(fallback_location: '/')
  end

  #POST /users/:id/disable_otp
  def admin_disable_otp
    user = User.find(params[:id])
    authorize! :edit, @user #prevent other users from disabling OTP on another user.
    user.otp_required_for_login = false
    user.save!
    flash[:notice] = "Successfully Dissabled 2 Factor Authentication."
    redirect_back(fallback_location: '/')
  end

  #reactivating user button function
  def admin_reactivate
    user = User.find(params[:id])
    authorize! :edit, @user #prevent other users from disabling OTP on another user.
    user.deactivated = false
    user.save!
    flash[:notice] = "Successfully Reactivated user."
    redirect_back(fallback_location: '/')
  end

  # need to override the update method so admins can fix accounts if users lock themselves out with 2fa enabled
  def update
  @user = User.find(params[:id])
  params[:user].delete(:password) if params[:user][:password].blank?
  params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

  if @user.update(user_params)
    flash[:notice] = "Successfully updated User."
    redirect_back(fallback_location: '/')
    else
      flash[:alert] = "An error occored."
      redirect_back(fallback_location: '/')
    end
  end




  private

  def user_params
     params.require(:user).permit(:email, :password, :password_confirmation, :deactivated, :deactivation_reason)
  end

end
