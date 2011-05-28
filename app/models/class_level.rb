class ClassLevel < ActiveRecord::Base
  belongs_to :modern_class
  
  def self.seed(class_name, levels)
    modern_class_id = ModernClass.find_by_class_name(class_name)
    level_number = 1
    levels.each do |level_data|
      
      class_level = ClassLevel.find_or_create_by_modern_class_id_and_level(
                  :modern_class_id => modern_class_id, :level => level_number).update_attributes(level_data)
      level_number = level_number + 1
    end
  end
end
