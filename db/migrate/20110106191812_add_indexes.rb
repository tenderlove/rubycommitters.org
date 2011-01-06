class AddIndexes < ActiveRecord::Migration
  def self.up
    add_index 'names', 'account_id'
    add_index 'sites', 'account_id'
    add_index 'services', 'account_id'
    add_index 'portraits', 'account_id'
    add_index 'books', 'account_id'
    add_index 'nicks', 'account_id'
  end

  def self.down
    remove_index 'nicks', :column => 'account_id'
    remove_index 'books', :column => 'account_id'
    remove_index 'portraits', :column => 'account_id'
    remove_index 'services', :column => 'account_id'
    remove_index 'sites', :column => 'account_id'
    remove_index 'names', :column => 'account_id'
  end
end
