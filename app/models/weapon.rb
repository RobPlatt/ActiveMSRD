require 'csv'

class Weapon < ActiveRecord::Base
  has_many :character_weapons, :dependent => :restrict
  
  def to_param
    "#{id}-#{weapon_name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def is_ranged
    return magazine != nil
  end
  
  def self.seed_ranged(filename)
   CSV.foreach filename do |row|
      Weapon.find_or_create_by_weapon_name(
      :weapon_name => row[0]).update_attributes(
      :damage => row[1],
      :critical => row[2],
      :damage_type => row[3],
      :range_increment => row[4],
      :rate_of_fire => row[5],
      :magazine => row[6],
      :size => row[7],
      :weight => row[8],
      :purchase_dc => row[9],
      :restriction => row[10],
      :weapon_type => row[11],
      :setting => row[12]
      )
    end
  end
  
end
