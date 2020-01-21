# -*- encoding : utf-8 -*-
class AddSiteColumnToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :site, :string
  end
end
