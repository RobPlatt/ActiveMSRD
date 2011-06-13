class AddTalentToClassLevel < ActiveRecord::Migration
  def self.up
    add_column :class_levels, :talent, :boolean
  end

  def self.down
    remove_column :class_levels, :talent
  end
end
