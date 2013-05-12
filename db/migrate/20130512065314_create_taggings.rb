class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :task

      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :task_id
  end
end
