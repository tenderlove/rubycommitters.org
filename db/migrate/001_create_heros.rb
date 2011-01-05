class CreateHeros < ActiveRecord::Migration
  def self.up
    create_table :heros do |t|
      t.string :username
      t.timestamps
    end
  end

  def self.down
    drop_table :heros
  end
end
