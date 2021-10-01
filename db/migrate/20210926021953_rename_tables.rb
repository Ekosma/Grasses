class RenameTables < ActiveRecord::Migration[6.1]
  def change
    rename_table :student_periods, :student_period
  end
end

