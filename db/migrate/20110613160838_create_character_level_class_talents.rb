class CreateCharacterLevelClassTalents < ActiveRecord::Migration
  def self.up
    create_table :character_level_class_talents do |t|
      t.integer :character_level_id
      t.integer :class_talent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_level_class_talents
  end
end
