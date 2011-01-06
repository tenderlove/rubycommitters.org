class AddTitlesToBooks < ActiveRecord::Migration
  def self.up
     add_column :books, :title, :string, :default => "Ruby Book"
  end

  def self.down
    remove_column :books, :title
  end
end
