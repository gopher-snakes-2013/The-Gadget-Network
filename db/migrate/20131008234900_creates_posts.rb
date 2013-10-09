class CreatesPosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :feed_entry
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
