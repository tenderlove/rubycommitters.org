class AddValueToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :value, :string
  end

  def self.down
    remove_column :books, :value
  end
end
