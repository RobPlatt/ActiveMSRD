class CreateClassTalents < ActiveRecord::Migration
  def self.up
    create_table :class_talents do |t|
      t.string :talent_name
      t.text :description
      t.string :prerequisite
      t.references :modern_class

      t.timestamps
    end
  end

  def self.down
    drop_table :class_talents
  end
end
