class CharacterLevelClassTalent < ActiveRecord::Base
  belongs_to :character_level
  belongs_to :class_talent
end
