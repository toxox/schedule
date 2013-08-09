class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :teacher
      t.string :time

      t.timestamps
    end
  end
end
