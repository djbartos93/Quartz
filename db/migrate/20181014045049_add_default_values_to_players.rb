class AddDefaultValuesToPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :players, :user_enabled, 1
    change_column_default :players, :admin_disabled, 1
    change_column_default :players, :invites, 5
  end
end
