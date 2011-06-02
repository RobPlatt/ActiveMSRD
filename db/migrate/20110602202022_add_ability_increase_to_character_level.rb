class AddAbilityIncreaseToCharacterLevel < ActiveRecord::Migration
  def self.up
    add_column :character_levels, :ability_increase, :string
  end

  def self.down
    remove_column :character_levels, :ability_increase
  end
end
