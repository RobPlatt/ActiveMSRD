class OccupationSkill < ActiveRecord::Base
  belongs_to :occupation
  belongs_to :skill
end
