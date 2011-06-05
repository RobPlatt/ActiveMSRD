class AddStyleAndSettingToArmor < ActiveRecord::Migration
  def self.up
    add_column :armors, :style, :string
    add_column :armors, :setting, :string
  end

  def self.down
    remove_column :armors, :setting
    remove_column :armors, :style
  end
end
