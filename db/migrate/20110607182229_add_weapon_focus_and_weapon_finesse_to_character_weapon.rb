class AddWeaponFocusAndWeaponFinesseToCharacterWeapon < ActiveRecord::Migration
  def self.up
    add_column :character_weapons, :weapon_focus, :boolean, :default => false
    add_column :character_weapons, :weapon_finesse, :boolean, :default => false
  end

  def self.down
    remove_column :character_weapons, :weapon_finesse
    remove_column :character_weapons, :weapon_focus
  end
end
