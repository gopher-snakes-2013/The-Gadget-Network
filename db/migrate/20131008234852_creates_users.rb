class CreatesUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email


      t.timestamp
    end
  end

  def down
    drop_table :users
  end
end
