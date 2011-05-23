class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters, :primary_key => :name do |t|
      t.string :name
      t.text :description
      t.text :code
      t.integer :starting_str, :default => 10
      t.integer :starting_dex, :default => 10
      t.integer :starting_con, :default => 10
      t.integer :starting_int, :default => 10
      t.integer :starting_wis, :default => 10
      t.integer :starting_cha, :default => 10
      t.references :race, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
