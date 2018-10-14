class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :token
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
