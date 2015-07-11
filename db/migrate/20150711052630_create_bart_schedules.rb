class CreateBartSchedules < ActiveRecord::Migration
  def change
    create_table :bart_schedules do |t|

      t.timestamps null: false
    end
  end
end
