class CreateCharacterWeapons < ActiveRecord::Migration
  def self.up
    create_table :character_weapons do |t|
      t.integer :character_id
      t.integer :weapon_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_weapons
  end
end
