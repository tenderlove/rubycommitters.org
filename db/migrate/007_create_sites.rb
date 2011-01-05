class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :title
      t.string :url
      t.string :feed
      t.string :lang
      t.references :hero
      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
