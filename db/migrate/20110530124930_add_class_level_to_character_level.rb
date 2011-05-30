class AddClassLevelToCharacterLevel < ActiveRecord::Migration
  def self.up
    add_column :character_levels, :class_level_id, :integer
  end

  def self.down
    remove_column :character_levels, :class_level_id 
  end
end
