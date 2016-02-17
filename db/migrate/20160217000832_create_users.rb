class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :token
      t.string :username
      t.string :refresh_token

      t.timestamps null: false
    end
  end
end
