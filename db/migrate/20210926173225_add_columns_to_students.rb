class AddColumnsToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :favorite_color, :string
    add_column :students, :favorite_food, :string
    add_column :students, :student_comment, :text
  end
end
