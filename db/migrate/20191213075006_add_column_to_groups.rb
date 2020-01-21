# -*- encoding : utf-8 -*-
class AddColumnToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :description, :string
  end
end
