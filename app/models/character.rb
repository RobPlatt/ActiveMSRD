class Character < ActiveRecord::Base
  has_many :character_levels, :dependent => :destroy
  belongs_to :race
end
