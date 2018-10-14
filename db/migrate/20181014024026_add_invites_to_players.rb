class AddInvitesToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :invites, :integer
  end
end
