class ClassTalent < ActiveRecord::Base
  belongs_to :modern_class
  has_many :character_level_class_talents
end
