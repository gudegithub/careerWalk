# -*- encoding : utf-8 -*-
class RemovePublishFlgColumFromEventTabel < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :publish_flg, :string
  end
end
