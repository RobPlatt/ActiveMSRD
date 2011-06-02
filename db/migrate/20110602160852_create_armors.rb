class CreateArmors < ActiveRecord::Migration
  def self.up
    create_table :armors do |t|
      t.string :armor_name
      t.string :armor_type
      t.integer :prof_bonus
      t.integer :nonprof_bonus
      t.integer :max_dex_bonus
      t.integer :armor_penalty
      t.integer :arcane_spell_failure
      t.integer :speed
      t.integer :weight
      t.integer :purchase_dc
      t.string :restriction

      t.timestamps
    end
  end

  def self.down
    drop_table :armors
  end
end
