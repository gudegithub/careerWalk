# -*- encoding : utf-8 -*-
class AddLonLatAddressLimitToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :lat, :float
    add_column :events, :lon, :float
    add_column :events, :address, :string
  end
end
