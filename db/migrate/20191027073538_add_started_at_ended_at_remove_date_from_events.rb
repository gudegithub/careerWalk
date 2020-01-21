# -*- encoding : utf-8 -*-
class AddStartedAtEndedAtRemoveDateFromEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :started_at, :datetime
    add_column :events, :ended_at, :datetime
    remove_column :events, :date, :string
  end
end
