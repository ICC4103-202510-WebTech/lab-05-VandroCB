class AddMessagesCountToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :messages_count, :integer
  end
end
