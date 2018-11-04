class RegistrationsController < Devise::RegistrationsController
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

  def save
    super

    # TODO: delete invite if user created successfully
  end
end
