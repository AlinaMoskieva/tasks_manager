class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.boolean :status, default: false, null: false
      t.belongs_to :project, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
