class Race < ActiveRecord::Base
  has_many :characters, :dependent => :restrict
end
