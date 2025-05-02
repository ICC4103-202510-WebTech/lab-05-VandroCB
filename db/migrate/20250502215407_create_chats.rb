class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :chats do |t|
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false

      t.timestamps
    end
  end
end
