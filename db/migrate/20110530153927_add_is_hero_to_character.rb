class AddIsHeroToCharacter < ActiveRecord::Migration
  def self.up
    add_column :characters, :is_hero, :boolean
  end

  def self.down
    remove_column :characters, :is_hero
  end
end
