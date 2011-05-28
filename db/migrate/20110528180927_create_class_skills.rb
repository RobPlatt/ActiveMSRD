class CreateClassSkills < ActiveRecord::Migration
  def self.up
    create_table :class_skills do |t|
      t.references :modern_class
      t.references :skill
      
      t.timestamps
    end
  end

  def self.down
    drop_table :class_skills
  end
end
