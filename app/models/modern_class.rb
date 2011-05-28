class ModernClass < ActiveRecord::Base
  has_many :class_levels, :dependent => :restrict
  has_many :class_skills, :dependent => :restrict
  has_many :skills, :through => :class_skills
  
  def each_level
    sorted_class_levels = class_levels.sort {|x,y|x.level <=> y.level}
    sorted_class_levels.each{|x|yield x}
  end
end
