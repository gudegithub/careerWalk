# -*- encoding : utf-8 -*-
class AddDetailColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :detail, :string, limit: 10000
  end
end
