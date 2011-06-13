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
        end
      else
        if occupation_name and description
          occupation_id = Occupation.find_or_create_by_name(
              occupation_name.rstrip).update_attributes(
              :description => description.rstrip,
              :prerequisite => prerequisite.rstrip
            )
          bonus_feats.each { |feat|
            OccupationFeat.find_or_create_by_occupation_id_and_feat_id(
                   :occupation_id => occupation_id, :feat_id =>feat.id)
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
