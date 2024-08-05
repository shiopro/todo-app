class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false
      t.timestamps
    end
  end
end
