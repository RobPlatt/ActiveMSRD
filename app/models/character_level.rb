class CharacterLevel < ActiveRecord::Base
  belongs_to :character
  belongs_to :class_level
  has_one    :modern_class, :through => :class_level
  
  def <=>(other)
    if self.level < other.level
      return -1
    elsif self.level > other.level
      return 1
    else
      return 0
    end
  end
  
  def self.seed(character, levels)
    level_number = 1
    levels.each do |level_data|
      character_level = CharacterLevel.find_or_create_by_character_id_and_level(
                  :character_id => character.id, :level => level_number)
      character_level.update_attributes(level_data)
      level_number = level_number + 1
    end
  end
  
end
