class AddStatusToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :attend_status, :integer, default: 0, null: false
  end
end
