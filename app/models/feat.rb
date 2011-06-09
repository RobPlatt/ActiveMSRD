class Feat < ActiveRecord::Base
  has_many :character_level_feats, :dependent => :restrict
  has_many :class_feats, :dependent => :restrict
  has_many :occupation_feats, :dependent => :restrict
  has_many :character_occupations, :dependent => :restrict
  
  def to_param
    "#{id}-#{feat_name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def self.seed(filename)
    firstline = true
    
    feat_name = nil
    prerequisites = ""
    benefit = ""
    normal = ""
    special = ""
    
    count = 0
    
    File.open(filename).each do |line|
      if firstline
        firstline = false
        next
      end
      
      if line.match /[A-Z]/
        if feat_name == nil
          feat_name = line
        else
          line.match(/^Prerequisite(s*): (.*)/) {|x| prerequisites = prerequisites + x[2]}
          line.match(/^Benefit(s*): (.*)/) {|x| benefit = benefit + x[2]}
          line.match(/^Normal: (.*)/) {|x| normal = normal + x[1]}
          line.match(/^Special: (.*)/) {|x| special = special + x[1]}
        end
      else
        if feat_name
          Feat.find_or_create_by_feat_name(
              :feat_name => feat_name.rstrip).update_attributes(
              :prerequisite => prerequisites.rstrip,
              :benefit => benefit.rstrip,
              :normal => normal.rstrip,
              :special => special.rstrip
            )
          feat_name = nil
          prerequisites = ""
          benefit = ""
          normal = ""
          special = ""
          count = count + 1
        end
      end        
    end
    puts "   ... #{count} feats added"
  end
end