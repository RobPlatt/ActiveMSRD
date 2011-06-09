class CreateOccupationFeats < ActiveRecord::Migration
  def self.up
    create_table :occupation_feats do |t|
      t.integer :occupation_id
      t.integer :feat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :occupation_feats
  end
end
