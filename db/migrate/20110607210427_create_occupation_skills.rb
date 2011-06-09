class CreateOccupationSkills < ActiveRecord::Migration
  def self.up
    create_table :occupation_skills do |t|
      t.integer :occupation_id
      t.integer :skill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :occupation_skills
  end
end
