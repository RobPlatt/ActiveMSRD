class CharacterOccupation < ActiveRecord::Base
  belongs_to :character
  belongs_to :occupation
  belongs_to :feat
end
