class CreateClassFeats < ActiveRecord::Migration
  def self.up
    create_table :class_feats do |t|
      t.integer :modern_class_id
      t.integer :feat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :class_feats
  end
end
