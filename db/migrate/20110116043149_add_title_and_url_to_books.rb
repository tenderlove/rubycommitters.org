class AddTitleAndUrlToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :title, :string
    add_column :books, :url, :string
  end

  def self.down
    remove_column :books, :title, :string
    remove_column :books, :url, :string
  end
end
