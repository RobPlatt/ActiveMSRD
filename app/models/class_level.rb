class ClassLevel < ActiveRecord::Base
  belongs_to :modern_class
  has_many :character_levels, :dependent => :restrict
  
  def name
    return "#{modern_class.class_name} #{level}"
  end
  
  def <=>(other)
    if self.level < other.level
      return -1
    elsif self.level > other.level
      return 1
    else
      return 0
    end
  end
  
  def self.calculate_bab_for_level(level_number, bab_type)
    if (bab_type == 'full')
      return level_number
    elsif (bab_type == 'three-quarters')
      return [nil, 0, 1, 2, 3, 3, 4, 5, 6, 6, 7][level_number]
    elsif (bab_type == 'half')
      return [nil, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5][level_number]
    end
  end
  
  def self.calculate_save_for_level(level_number, good)
    if (good)
      return [nil, 1, 2, 2, 3, 3, 3, 4, 4, 5, 5][level_number]
    else
      return [nil, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3][level_number]
    end
  end
  
  def self.calculate_defence_bonus_for_level(level_number, type)
    if (type == 'poor')
      return [nil, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3][level_number]
    elsif (type == 'average')
      return [nil, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5][level_number]
    elsif (type == 'good')
      return [nil, 1, 2, 2, 3, 4, 4, 5, 6, 6, 7][level_number]
    elsif (type == 'excellent')
      return [nil, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8][level_number]
    end
  end

  def self.calculate_reputation_bonus_for_level(level_number, type)
    if (type == 'poor')
      return [nil, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2][level_number]
    elsif (type == 'average')
      return [nil, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3][level_number]
    elsif (type == 'good')
      return [nil, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4][level_number]
    elsif (type == 'excellent')
      return [nil, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5][level_number]
    end
  end
 
  def self.seed(modern_class, levels)
    level_number = 1
    levels.each do |level_data|
      
      if level_data[:bab] == nil
        level_data[:bab] = ClassLevel.calculate_bab_for_level(level_number, modern_class.bab)
      end
      
      if level_data[:base_fort] == nil
        level_data[:base_fort] = ClassLevel.calculate_save_for_level(
                                            level_number,
                                            modern_class.good_fort)
      end
      
      if level_data[:base_ref] == nil
        level_data[:base_ref] = ClassLevel.calculate_save_for_level(
                                            level_number,
                                            modern_class.good_ref)
      end
      
      if level_data[:base_will] == nil
        level_data[:base_will] = ClassLevel.calculate_save_for_level(
                                            level_number,
                                            modern_class.good_will)
      end
      
      if level_data[:defence_bonus] == nil
        level_data[:defence_bonus] = ClassLevel.calculate_defence_bonus_for_level(
                                            level_number,
                                            modern_class.defence_bonus)
      end
      
      if level_data[:reputation_bonus] == nil
        level_data[:reputation_bonus] = ClassLevel.calculate_reputation_bonus_for_level(
                                            level_number,
                                            modern_class.reputation_bonus)
      end
      
      class_level = ClassLevel.find_or_create_by_modern_class_id_and_level(
                  :modern_class_id => modern_class.id, :level => level_number).update_attributes(level_data)
      level_number = level_number + 1
    end
  end
  
  def has_feat
    if bonus_feat
      return true
    else
      return false
    end
  end
  
  def bonus_feat_list
    if class_feat
      return modern_class.feats
    end
  end
end
