class AddBonusFeatToClassLevel < ActiveRecord::Migration
  def self.up
    add_column :class_levels, :bonus_feat, :boolean
  end

  def self.down
    remove_column :class_levels, :bonus_feat
  end
end
