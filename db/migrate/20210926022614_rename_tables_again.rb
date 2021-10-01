class RenameTablesAgain < ActiveRecord::Migration[6.1]
  def change
    rename_table :student_period, :student_periods
  end
end
