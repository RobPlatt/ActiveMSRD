require 'csv'

class Armor < ActiveRecord::Base
  has_many :characters, :dependent => :restrict
  
  def self.seed(filename)
   CSV.foreach filename do |row|
      Armor.find_or_create_by_armor_name(
        :armor_name => row[0],
        :style => row[1],
        :prof_bonus => row[2],
        :nonprof_bonus => row[3],
        :max_dex_bonus => row[4],
        :armor_penalty => row[5],
        :arcane_spell_failure => row[6],
        :speed => row[7],
        :weight => row[8],
        :purchase_dc => row[9],
        :restriction => row[10],
        :armor_type => row[11],
        :setting => row[12])
      end
  end
end
