class AddStableToRace < ActiveRecord::Migration
  def self.up
    add_column :races, :stable, :boolean
  end

  def self.down
    remove_column :races, :stable
  end
end
