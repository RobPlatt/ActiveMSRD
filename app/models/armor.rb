require 'csv'

class Armor < ActiveRecord::Base
  has_many :characters, :dependent => :restrict
  
  def to_param
    "#{id}-#{armor_name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def self.seed(filename)
   CSV.foreach filename do |row|
      Armor.find_or_create_by_armor_name(
        :armor_name => row[0].rstrip).update_attributes(
        :style => row[1].rstrip,
        :prof_bonus => row[2].rstrip,
        :nonprof_bonus => row[3].rstrip,
        :max_dex_bonus => row[4].rstrip,
        :armor_penalty => row[5].rstrip,
        :arcane_spell_failure => row[6].rstrip,
        :speed => row[7].rstrip,
        :weight => row[8].rstrip,
        :purchase_dc => row[9].rstrip,
        :restriction => row[10].rstrip,
        :armor_type => row[11].rstrip,
        :setting => row[12].rstrip)
      end
  end
end
