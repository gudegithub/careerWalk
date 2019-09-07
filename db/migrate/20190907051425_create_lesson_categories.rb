class CreateLessonCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_categories do |t|
      t.references :lesson, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
