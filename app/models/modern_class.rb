class ModernClass < ActiveRecord::Base
  has_many :class_levels, :dependent => :restrict
  has_many :class_skills, :dependent => :restrict
  has_many :skills, :through => :class_skills
  
  def each_level
    sorted_class_levels = class_levels.sort {|x,y|x.level <=> y.level}
    sorted_class_levels.each{|x|yield x}
  end
  
  def seed_skills(skill_list)
    #TODO remove unlisted skills
    
    skill_list.each do
      |skill_name|
      skill_id = Skill.find_by_skill_name(skill_name)
      ClassSkill.find_by_modern_class_id_and_skill_id(id, skill_id)
    end
    
  end
  
end
