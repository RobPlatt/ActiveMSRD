class CreateCharacterLevels < ActiveRecord::Migration
  def self.up
    create_table :character_levels do |t|
      t.references :character
      t.integer :level
      t.integer :hit_die_roll

      t.timestamps
    end
  end

  def self.down
    drop_table :character_levels
  end
end
