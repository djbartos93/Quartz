class AssociateInvitesToUsersInsteadOfPlayers < ActiveRecord::Migration[5.2]
  def up
    unless column_exists? :users, :available_invites
      add_column :users, :available_invites, :integer, default: 5
    end
    User.find_each do |user|
      user.available_invites = Player.find_by(user_id: user.id).available_invites
    end

    unless column_exists? :invites, :user_id
      add_reference :invites, :user, index: true
    end
    Invite.find_each do |invite|
      invite.user = User.find_by(id: Player.find_by(id: invite.player_id).user_id)
    end
  end

  def down
    Player.find_each do |player|
      player.available_invites = User.find_by(player: player).available_invites
    end

    Invite.find_each do |invite|
      invite.player = User.find_by(id: invite.user_id).player
    end
  end
end
