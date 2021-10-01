class Constraint < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :student_periods, :students, on_delete: :cascade, column: :students_id
    add_foreign_key :student_periods, :periods, on_delete: :cascade, column: :periods_id
  end
end