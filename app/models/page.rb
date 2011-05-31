class Page < ActiveRecord::Base
  
  def <=>(other)
    if self.title < other.title
      return -1
    elsif self.title > other.title
      return 1
    else
      return 0
    end
  end
  
  def self.from_wiki_link(text)
    return find_by_title(text)
  end
  
  def to_param
    "#{id}-#{title.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
end
