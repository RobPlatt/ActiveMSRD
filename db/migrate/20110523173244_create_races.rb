class CreateRaces < ActiveRecord::Migration
  def self.up
    create_table :races do |t|
      t.string :name
      t.text :description
      t.string :size, :default => "medium"
      t.integer :base_speed, :default => 30
      t.text :code

      t.timestamps
    end
  end

  def self.down
    drop_table :races
  end
end
