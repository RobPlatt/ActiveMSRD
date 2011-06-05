class AddArmorIdToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :armor_id, :integer
  end

  def self.down
    remove_column :characters, :armor_id
  end
end
