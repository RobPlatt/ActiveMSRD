class AddMastercraftToCharacterWeapon < ActiveRecord::Migration
  def self.up
    add_column :character_weapons, :mastercraft, :boolean
  end

  def self.down
    remove_column :character_weapons, :mastercraft
  end
end
