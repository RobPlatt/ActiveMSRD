class ModernClass < ActiveRecord::Base
  has_many :class_levels, :dependent => :restrict
  has_many :class_skills, :dependent => :restrict
  has_many :skills, :through => :class_skills
  
  def each_level
    class_levels.sort.each{|x|yield x}
  end
end
