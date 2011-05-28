class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.string :skill_name
      t.boolean :trained_only, :default => false
      t.boolean :armor_penalty, :default => false
      t.string :key_ability

      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
