class AddBabAndSavesToModernClass < ActiveRecord::Migration
  def self.up
    add_column :modern_classes, :bab, :string, :default => 'half'
    add_column :modern_classes, :good_fort, :boolean, :default => false
    add_column :modern_classes, :good_ref, :boolean, :default => false
    add_column :modern_classes, :good_will, :boolean, :default => false
  end

  def self.down
    remove_column :modern_classes, :good_will
    remove_column :modern_classes, :good_ref
    remove_column :modern_classes, :good_fort
    remove_column :modern_classes, :bab
  end
end
