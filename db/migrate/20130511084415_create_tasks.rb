class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :complete, default: false, null: false
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
