class AddSettingToFeats < ActiveRecord::Migration
  def self.up
    add_column :feats, :setting, :string
  end

  def self.down
    remove_column :feats, :setting
  end
end
