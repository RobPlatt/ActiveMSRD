class CreateCharacterSkills < ActiveRecord::Migration
  def self.up
    create_table :character_skills do |t|
      t.references :character
      t.references :skill
      t.integer :ranks, :default => 0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :character_skills
  end
end
