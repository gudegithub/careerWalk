# -*- encoding : utf-8 -*-
class ChangePublishFlgColumn < ActiveRecord::Migration[5.2]
  def change 
    change_column :events, :publish_flg, :boolean, default: false, null: false
  end
end
