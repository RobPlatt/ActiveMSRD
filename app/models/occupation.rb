class Occupation < ActiveRecord::Base
  has_many :occupation_feats
  has_many :feats, :through => :occupation_feats
  has_many :occupation_skills
  has_many :skills, :through => :occupation_skills
  has_many :character_occupations
  
  def self.seed(filename)
    firstline = true
    
    occupation_name = nil
    prerequisite = ""
    description = nil
    bonus_feats = []
    permanent_skills = []
    num_skills = nil
    
    count = 0
    
    File.open(filename).each do |line|
      if firstline
        firstline = false
        next
      end
      
      if line.match /^[A-Z]/
        if occupation_name == nil
          occupation_name = line
        elsif description == nil
          description = line
        else
          line.match(/^Prerequisite(s*): (.*)/) {|x| prerequisite = prerequisite + x[2]}
          line.match(/^Bonus Feat(s*): (.*)/) {|x|
            Feat.all.each { |feat|
              if line.include?(feat.feat_name)
                bonus_feats.push(feat)
              end
              }
            }
          line.match(/^Skills: Choose (\w+) (.*)/) {|x|
            Skill.all.each { |skill|
              if x[2].include?(skill.skill_name)
                permanent_skills.push(skill)
              end
              }
            if x[1] == 'one'
              num_skills = 1
            elsif x[1] == 'two'
              num_skills = 2
            elsif x[1] == 'three'
              num_skills = 3
            end
          }
        end
      else
        if occupation_name and description
          occupation = Occupation.find_or_create_by_name(
                                       occupation_name.rstrip)
          occupation.update_attributes(
              :description => description.rstrip,
              :prerequisite => prerequisite.rstrip,
              :num_skills_to_choose => num_skills
              )
          bonus_feats.each { |feat|
            OccupationFeat.find_or_create_by_occupation_id_and_feat_id(
                   :occupation_id => occupation.id, :feat_id => feat.id)
                 }
          permanent_skills.each { |skill|
            OccupationSkill.find_or_create_by_occupation_id_and_skill_id(
                   :occupation_id => occupation.id, :skill_id => skill.id)
          }
          occupation_name = nil
          prerequisite = ""
          description = nil
          count = count + 1
        end
      end
    end
    puts "   ... #{count} occupations added"
  end
end
