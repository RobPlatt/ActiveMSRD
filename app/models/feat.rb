class Feat < ActiveRecord::Base
  has_many :character_level_feats, :dependent => :restrict
  has_many :class_feats, :dependent => :restrict
  has_many :occupation_feats, :dependent => :restrict
  has_many :character_occupations, :dependent => :restrict
  
  def to_param
    "#{id}-#{feat_name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def <=>(other)
    if self.feat_name < other.feat_name
      return -1
    elsif self.feat_name > other.feat_name
      return 1
    else
      return 0
    end
  end
  
  def self.seed(filename)
    firstline = true
    
    feat_name = nil
    prerequisites = ""
    benefit = ""
    normal = ""
    special = ""
    description = ""
    setting = "core"
    
    count = 0
    
    File.open(filename).each do |line|
      if firstline
        firstline = false
        next
      end
      
      if line.match /[A-Z]/
        if feat_name == nil
            x = line.match(/^START FEATS FOR: (.*)/)
            if x
              setting = x[1]
            else
              feat_name = line
            end
        else
          matched = false
          line.match(/^Prerequisite(s*): (.*)/) {|x|
            prerequisites = prerequisites + x[2]
            matched = true}  
          line.match(/^Benefit(s*): (.*)/) {|x| benefit = benefit + x[2]
            matched = true}
          line.match(/^Normal: (.*)/) {|x| normal = normal + x[1]
            matched = true}
          line.match(/^Special: (.*)/) {|x| special = special + x[1]
            matched = true}
            
          if matched == false
            description = line
          end
        end
      else
        if feat_name
          # Title case for feat names. Leave hyphens alone.
          if not feat_name.include?('-')
            feat_name = feat_name.titleize
          end
          Feat.find_or_create_by_feat_name(
              :feat_name => feat_name.rstrip).update_attributes(
              :description => description.rstrip,
              :setting => setting.rstrip,
              :prerequisite => prerequisites.rstrip,
              :benefit => benefit.rstrip,
              :normal => normal.rstrip,
              :special => special.rstrip
            )
          feat_name = nil
          description = ""
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
