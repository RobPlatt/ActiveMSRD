class CharacterLevel < ActiveRecord::Base
  belongs_to :character
  belongs_to :class_level
  has_one    :modern_class, :through => :class_level
  has_one    :race, :through => :character 
  has_many   :character_level_feats, :dependent => :destroy
  accepts_nested_attributes_for :character_level_feats
  
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
  
  def num_feat_slots
    feats = 0
    if level == 1
      feats.next
      if race == nil or race == 'human'
        feats.next
      end
    elsif level.modulo(3) == 0
      feats.next
    end
    
    if class_level and class_level.has_feat
      feats.next
    end
    
    return feats
  end
  
  def feats_allowed(feat_number)
    if feat_number == num_feat_slots and class_level and class_level.bonus_feat
      return class_level.bonus_feat_list
    else
      return Feat.all
    end
  end
  
end
