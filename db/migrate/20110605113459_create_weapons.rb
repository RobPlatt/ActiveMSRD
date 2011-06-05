class CreateWeapons < ActiveRecord::Migration
  def self.up
    create_table :weapons do |t|
      t.string :weapon_name
      t.string :damage
      t.string :critical
      t.string :damage_type
      t.integer :range_increment
      t.string :rate_of_fire
      t.string :magazine
      t.string :size
      t.integer :weight
      t.integer :purchase_dc
      t.string :restriction
      t.string :weapon_type
      t.string :burst_radius
      t.string :setting

      t.timestamps
    end
  end

  def self.down
    drop_table :weapons
  end
end
