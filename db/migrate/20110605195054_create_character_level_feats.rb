class CreateCharacterLevelFeats < ActiveRecord::Migration
  def self.up
    create_table :character_level_feats do |t|
      t.integer :character_level_id
      t.integer :feat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_level_feats
  end
end
