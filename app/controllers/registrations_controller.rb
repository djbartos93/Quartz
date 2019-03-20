class RegistrationsController < Devise::RegistrationsController
  after_action :delete_invite, only: [:create]

  def devise_mapping
    Devise.mappings[:user]
  end

  def new
    super

    if not params[:token].blank?
      if Invite.where(token: params[:token]).any?
        # Link new user to the user who generated the invite
        @user.invited_by_user_id = Invite.find_by(token: params[:token]).user_id
      end
    end
  end

  def delete_invite
    if not params[:token].blank?
      if Invite.where(token: params[:token]).any?
        # Delete the invite used to create the user
        Invite.find_by(token: params[:token]).destroy
      end
    end
  end
end
