# -*- encoding : utf-8 -*-
class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :adminUser, :integer
  end
end
