class ModernClass < ActiveRecord::Base
  has_many :class_levels, :dependent => :restrict
end
