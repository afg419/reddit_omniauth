class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :link_karma, :integer
    add_column :users, :name, :string
    add_column :users, :comment_karma, :integer
    add_column :users, :reddit_id, :string
    add_column :users, :inbox_count, :integer
    add_column :users, :gold_creddits, :integer
  end
end
