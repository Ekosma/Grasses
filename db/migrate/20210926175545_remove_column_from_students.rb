class RemoveColumnFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :user_id, :integer
  end
end
