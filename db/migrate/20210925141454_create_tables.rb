class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.text :email
      t.string :password_digest
    end

    create_table :periods do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
    end

    create_table :students do |t|
      t.string :name
      t.date :birthday
      t.belongs_to :user, foreign_key: true
    end

    create_table :student_periods, id: false do |t|
      t.belongs_to :students
      t.belongs_to :periods
    end
  end
end
