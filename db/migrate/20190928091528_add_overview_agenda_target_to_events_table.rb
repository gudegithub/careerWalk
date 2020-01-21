# -*- encoding : utf-8 -*-
class AddOverviewAgendaTargetToEventsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :overview, :text
    add_column :events, :agenda, :text
    add_column :events, :target, :text
  end
end
