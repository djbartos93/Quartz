class AddDeactivationReasonToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deactivation_reason, :text
  end
end
