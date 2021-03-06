class Skill < ActiveRecord::Base
  has_many :class_skills, :dependent => :restrict
  has_many :modern_classes, :through => :class_skills
  has_many :character_skills, :dependent => :restrict
  has_many :characters, :through => :character_skills
  has_many :occupation_skills, :dependent => :restrict
  
  def to_param
    "#{id}-#{skill_name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def self.from_wiki_link(text)
    return find_by_skill_name(text)
  end
  
  def self.seed(skill_table)
    skill_table.each do
      |skill_entry|
      Skill.find_or_create_by_skill_name(skill_entry[:skill_name]).update_attributes(skill_entry)
    end
  end
  
  def self.each_except_languages
    Skill.all.each do |skill|
      if not skill.skill_name.include?(' Language')
        yield skill
      end
    end
  end
  
end
