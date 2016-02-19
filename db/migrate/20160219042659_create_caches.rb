class CreateCaches < ActiveRecord::Migration
  def change
    create_table :caches do |t|
      t.text :top
      t.text :new
      t.text :rising
      t.text :controversial
      t.text :hot
      t.text :gilded

      t.timestamps null: false
    end
  end
end
