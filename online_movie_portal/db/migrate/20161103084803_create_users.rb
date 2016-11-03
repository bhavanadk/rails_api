class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.integer :user_age
      t.string :user_role
      t.string :user_gender

      t.timestamps null: false
    end
  end
end
