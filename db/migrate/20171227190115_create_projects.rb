class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.belongs_to :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
