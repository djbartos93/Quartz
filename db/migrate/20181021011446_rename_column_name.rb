class RenameColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :invites, :available_invites
  end
end
