class AddDescriptionToFeats < ActiveRecord::Migration
  def self.up
    add_column :feats, :description, :text
  end

  def self.down
    remove_column :feats, :description
  end
end
