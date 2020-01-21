# -*- encoding : utf-8 -*-
class CreateUploadFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :upload_files do |t|
      t.string :default_file_name, limit: 200 
      t.string :managed_file_name, limit: 200
      t.string :fileable_type
      t.bigint :fileable_id
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
