class CharacterLevelFeat < ActiveRecord::Base
  belongs_to :character_level
  belongs_to :feat
end
