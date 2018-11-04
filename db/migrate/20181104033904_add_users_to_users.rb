class AddUsersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :invited_by_user, foreign_key: true
  end
end
