class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end

    add_column :tasks, :user_id, :integer
  end

  def down
    drop_table :users
    remove_column :tasks, :user_id
  end
end
