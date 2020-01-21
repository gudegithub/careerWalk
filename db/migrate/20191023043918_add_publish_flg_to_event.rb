# -*- encoding : utf-8 -*-
class AddPublishFlgToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :publish_flg, :boolean
  end
end
