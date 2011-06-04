class ClassSkill < ActiveRecord::Base
  belongs_to :modern_class
  belongs_to :skill
  
  def self.seed_from_list(modern_class, skill_list)

    skill_list.each do |skill_name|
      Skill.all.each do |skill|
        if skill.skill_name.include?(skill_name)
          ClassSkill.find_or_create_by_modern_class_id_and_skill_id(
             :modern_class_id => modern_class.id, :skill_id => skill.id)
        end
      end
    end
    
    def seed(modern_class, skill_text)
      seed_from_list(modern_class, skill_text)
    end
  end
end
