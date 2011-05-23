class CreateModernClasses < ActiveRecord::Migration
  def self.up
    create_table :modern_classes do |t|
      t.string :class_name
      t.integer :skill_points
      t.integer :action_points
      t.integer :hit_die

      t.timestamps
    end
  end

  def self.down
    drop_table :modern_classes
  end
end
