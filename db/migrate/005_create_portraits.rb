class CreatePortraits < ActiveRecord::Migration
  def self.up
    create_table :portraits do |t|
      t.string :url
      t.references :hero
      t.timestamps
    end
  end

  def self.down
    drop_table :portraits
  end
end
