require 'set'

class ClassSkill < ActiveRecord::Base
  belongs_to :modern_class
  belongs_to :skill
  
  def self.seed_from_list(modern_class, skill_list)
    skill_set = Set.new(Skill.all)
    skill_list.each do |skill_name|
      matches = skill_set.select {|skill| skill.skill_name.downcase == skill_name.downcase}
      if matches.count == 1
        ClassSkill.find_or_create_by_modern_class_id_and_skill_id(
           :modern_class_id => modern_class.id, :skill_id => matches[0].id)
      elsif matches.count == 0
        raise 'No match for skill "' + skill_name + '"'
      elsif matches.count > 1
        raise 'Multiple matches for skill "' + skill_name + '", ambiguous'
      end
    end
  end
    
  def self.seed(modern_class, skill_text)
    skill_list = []
    skill_text.gsub!(', and ', ', ') # get rid of 'and' in comma-separated list 
    skill_text.scan(/\s*([a-zA-Z\/ ]+) \(([^)]+)\)/) {|s1, s2|
      
      if s1 == 'Craft' or s1 == 'Knowledge' or s1 == 'Perform'
        s2.split(%r{,\s*}).each {|sub_skill| skill_list.push(s1 + ' (' + sub_skill +')')}
      else
        skill_list.push(s1)
      end
    }
    print modern_class.class_name + ' skills: ' + skill_list.to_s + "\n"
    ClassSkill.seed_from_list(modern_class, skill_list)
  end
end
