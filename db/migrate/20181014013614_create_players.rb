class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :username
      t.string :uuid
      t.boolean :user_enabled
      t.boolean :admin_disabled

      t.timestamps
    end
  end
end
