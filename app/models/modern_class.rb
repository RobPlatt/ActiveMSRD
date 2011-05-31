class ModernClass < ActiveRecord::Base
  has_many :class_levels, :dependent => :restrict
  has_many :class_skills, :dependent => :restrict
  has_many :skills, :through => :class_skills
  
  def self.from_wiki_link(text)
    return find_by_class_name(text)
  end
  
  def to_param
    "#{id}-#{class_name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def each_level
    class_levels.sort.each{|x|yield x}
  end
  
  def level(n)
    return class_levels.find_by_level(n)
  end
end
