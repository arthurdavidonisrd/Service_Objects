class CreateGradePointAverages < ActiveRecord::Migration[8.0]
  def change
    create_table :grade_point_averages do |t|
      t.decimal :exam
      t.decimal :cch
      t.decimal :final_average

      t.timestamps
    end
  end
end
