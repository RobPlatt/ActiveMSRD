class AddPrimaryStatToModernClasses < ActiveRecord::Migration
  def self.up
    add_column :modern_classes, :primary_stat, :string
  end

  def self.down
    remove_column :modern_classes, :primary_stat
  end
end
