# -*- encoding : utf-8 -*-
class RemoveOverviewAgendaTargetFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :overview, :string
    remove_column :events, :target, :string
    remove_column :events, :agenda, :string
  end
end
