class CreateFeats < ActiveRecord::Migration
  def self.up
    create_table :feats do |t|
      t.string :feat_name
      t.text :prerequisite
      t.text :benefit
      t.text :normal
      t.text :special

      t.timestamps
    end
  end

  def self.down
    drop_table :feats
  end
end
