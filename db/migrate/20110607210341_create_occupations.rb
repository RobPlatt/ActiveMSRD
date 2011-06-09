class CreateOccupations < ActiveRecord::Migration
  def self.up
    create_table :occupations do |t|
      t.string :name
      t.text :description
      t.string :prerequisite
      t.integer :reputation_bonus_increase
      t.integer :wealth_bonus_increase

      t.timestamps
    end
  end

  def self.down
    drop_table :occupations
  end
end
