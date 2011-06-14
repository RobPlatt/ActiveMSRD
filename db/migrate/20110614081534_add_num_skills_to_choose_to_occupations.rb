class AddNumSkillsToChooseToOccupations < ActiveRecord::Migration
  def self.up
    add_column :occupations, :num_skills_to_choose, :integer
  end

  def self.down
    remove_column :occupations, :num_skills_to_choose
  end
end
