class AddDefenceAndRepToModernClass < ActiveRecord::Migration
  def self.up
    add_column :modern_classes, :defence_bonus, :string, :default => 'average'
    add_column :modern_classes, :reputation_bonus, :string, :default => 'average'
  end

  def self.down
    remove_column :modern_classes, :reputation_bonus
    remove_column :modern_classes, :defence_bonus
  end
end
