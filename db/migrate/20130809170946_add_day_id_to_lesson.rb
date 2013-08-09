class AddDayIdToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :day_id, :integer
  end
end
