class CreateClassLevels < ActiveRecord::Migration
  def self.up
    create_table :class_levels do |t|
      t.references :modern_class
      t.integer :level
      t.integer :bab, :default => 0
      t.integer :base_fort, :default => 0
      t.integer :base_ref, :default => 0
      t.integer :base_will, :default => 0
      t.integer :defence_bonus, :default => 0
      t.integer :reputation_bonus, :default => 0
      t.text :code

      t.timestamps
    end
  end

  def self.down
    drop_table :class_levels
  end
end
