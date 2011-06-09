class CreateCharacterOccupations < ActiveRecord::Migration
  def self.up
    create_table :character_occupations do |t|
      t.integer :character_id
      t.integer :occupation_id
      t.integer :feat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :character_occupations
  end
end
