# -*- encoding : utf-8 -*-
class CreateInternships < ActiveRecord::Migration[5.0]
  def change
    create_table :internships do |t|
      t.string :title
      t.string :company
      t.string :companyLogo
      t.string :location
      t.date :date
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
