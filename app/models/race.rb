class Race < ActiveRecord::Base
  has_many :characters, :dependent => :restrict
  
  def self.from_wiki_link(text)
    return find_by_name(text)
  end
  
  def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def size_mod
    if (size == 'medium')
      return 0
    elsif (size == 'small')
      return 1
    elsif (size == 'large')
      return -1
    end
  end
  
  def attack_size_mod
    return size_mod
  end
  
  def defence_size_mod
    return size_mod
  end
  
  def strength_check_size_mod
    return -4 * size_mod
  end
  
  def stability_mod
    if (stable)
      return 4
    else
      return 0
    end
  end
  
end
