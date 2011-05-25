# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Race.create([
  { :name => 'human'},
  { :name => 'gnome', :base_speed => 20, :size => 'small'}])
             
ModernClass.create([
  { :class_name => 'Strong Hero',
    :primary_stat => 'strength',
    :skill_points => 2,
    :action_points => 5,
    :hit_die => 8 },
  
  { :class_name => 'Fast Hero',
    :primary_stat => 'dexterity',
    :skill_points => 4,
    :action_points => 5,
    :hit_die => 8 },

  { :class_name => 'Tough Hero',
    :primary_stat => 'constitution',
    :skill_points => 2,
    :action_points => 5,
    :hit_die => 10 },

  { :class_name => 'Smart Hero',
    :primary_stat => 'intelligence',
    :skill_points => 8,
    :action_points => 5,
    :hit_die => 6 },
  
  { :class_name => 'Dedicated Hero',
    :primary_stat => 'wisdom',
    :skill_points => 4,
    :action_points => 5,
    :hit_die => 6 },

  { :class_name => 'Charismatic Hero',
    :primary_stat => 'charisma',
    :skill_points => 6,
    :action_points => 5,
    :hit_die => 6 }
    
  ])

ClassLevel.create([
  ###################
  # The Strong Hero #
  ###################
  { :modern_class_id => 1,
    :level => 1,
    :bab => 1, :base_fort => 1, :base_ref => 0, :base_will => 0,
    :defence_bonus => 1, :reputation_bonus => 0 },
    
  { :modern_class_id => 1,
    :level => 2,
    :bab => 2, :base_fort => 2, :base_ref => 0, :base_will => 0,
    :defence_bonus => 2, :reputation_bonus => 0 },

  { :modern_class_id => 1,
    :level => 3,
    :bab => 3, :base_fort => 2, :base_ref => 1, :base_will => 1,
    :defence_bonus => 2, :reputation_bonus => 0 },

  { :modern_class_id => 1,
    :level => 4,
    :bab => 4, :base_fort => 3, :base_ref => 1, :base_will => 1,
    :defence_bonus => 3, :reputation_bonus => 0 },

  { :modern_class_id => 1,
    :level => 5,
    :bab => 5, :base_fort => 3, :base_ref => 1, :base_will => 1,
    :defence_bonus => 3, :reputation_bonus => 1 },

  { :modern_class_id => 1,
    :level => 6,
    :bab => 6, :base_fort => 3, :base_ref => 2, :base_will => 2,
    :defence_bonus => 3, :reputation_bonus => 1 },

  { :modern_class_id => 1,
    :level => 7,
    :bab => 7, :base_fort => 4, :base_ref => 2, :base_will => 2,
    :defence_bonus => 4, :reputation_bonus => 1 },

  { :modern_class_id => 1,
    :level => 8,
    :bab => 8, :base_fort => 4, :base_ref => 2, :base_will => 2,
    :defence_bonus => 4, :reputation_bonus => 1 },

  { :modern_class_id => 1,
    :level => 9,
    :bab => 9, :base_fort => 5, :base_ref => 3, :base_will => 3,
    :defence_bonus => 5, :reputation_bonus => 2 },

  { :modern_class_id => 1,
    :level => 10,
    :bab => 10, :base_fort => 5, :base_ref => 3, :base_will => 3,
    :defence_bonus => 5, :reputation_bonus => 2 },

  ###################
  # The Fast Hero   #
  ###################
  { :modern_class_id => 2,
    :level => 1,
    :bab => 0, :base_fort => 0, :base_ref => 1, :base_will => 0,
    :defence_bonus => 3, :reputation_bonus => 0 },
    
  { :modern_class_id => 2,
    :level => 2,
    :bab => 1, :base_fort => 0, :base_ref => 2, :base_will => 0,
    :defence_bonus => 4, :reputation_bonus => 0 },

  { :modern_class_id => 2,
    :level => 3,
    :bab => 2, :base_fort => 1, :base_ref => 2, :base_will => 1,
    :defence_bonus => 4, :reputation_bonus => 1 },

  { :modern_class_id => 2,
    :level => 4,
    :bab => 3, :base_fort => 1, :base_ref => 3, :base_will => 1,
    :defence_bonus => 5, :reputation_bonus => 1 },

  { :modern_class_id => 2,
    :level => 5,
    :bab => 3, :base_fort => 1, :base_ref => 3, :base_will => 1,
    :defence_bonus => 5, :reputation_bonus => 1 },

  { :modern_class_id => 2,
    :level => 6,
    :bab => 4, :base_fort => 2, :base_ref => 3, :base_will => 2,
    :defence_bonus => 6, :reputation_bonus => 2 },

  { :modern_class_id => 2,
    :level => 7,
    :bab => 5, :base_fort => 2, :base_ref => 4, :base_will => 2,
    :defence_bonus => 6, :reputation_bonus => 2 },

  { :modern_class_id => 2,
    :level => 8,
    :bab => 6, :base_fort => 2, :base_ref => 4, :base_will => 2,
    :defence_bonus => 7, :reputation_bonus => 2 },

  { :modern_class_id => 2,
    :level => 9,
    :bab => 6, :base_fort => 3, :base_ref => 5, :base_will => 3,
    :defence_bonus => 7, :reputation_bonus => 3 },

  { :modern_class_id => 2,
    :level => 10,
    :bab => 7, :base_fort => 3, :base_ref => 5, :base_will => 3,
    :defence_bonus => 8, :reputation_bonus => 3 },

  ###################
  # The Tough Hero  #
  ###################
    { :modern_class_id => 3,
    :level => 1,
    :bab => 0, :base_fort => 1, :base_ref => 0, :base_will => 0,
    :defence_bonus => 1, :reputation_bonus => 0 },
    
  { :modern_class_id => 3,
    :level => 2,
    :bab => 1, :base_fort => 2, :base_ref => 0, :base_will => 0,
    :defence_bonus => 2, :reputation_bonus => 0 },

  { :modern_class_id => 3,
    :level => 3,
    :bab => 2, :base_fort => 2, :base_ref => 1, :base_will => 1,
    :defence_bonus => 2, :reputation_bonus => 1 },

  { :modern_class_id => 3,
    :level => 4,
    :bab => 3, :base_fort => 3, :base_ref => 1, :base_will => 1,
    :defence_bonus => 3, :reputation_bonus => 1 },

  { :modern_class_id => 3,
    :level => 5,
    :bab => 3, :base_fort => 3, :base_ref => 1, :base_will => 1,
    :defence_bonus => 3, :reputation_bonus => 1 },

  { :modern_class_id => 3,
    :level => 6,
    :bab => 4, :base_fort => 3, :base_ref => 2, :base_will => 2,
    :defence_bonus => 3, :reputation_bonus => 2 },

  { :modern_class_id => 3,
    :level => 7,
    :bab => 5, :base_fort => 4, :base_ref => 2, :base_will => 2,
    :defence_bonus => 4, :reputation_bonus => 2 },

  { :modern_class_id => 3,
    :level => 8,
    :bab => 6, :base_fort => 4, :base_ref => 2, :base_will => 2,
    :defence_bonus => 4, :reputation_bonus => 2 },

  { :modern_class_id => 3,
    :level => 9,
    :bab => 6, :base_fort => 5, :base_ref => 3, :base_will => 3,
    :defence_bonus => 5, :reputation_bonus => 3 },

  { :modern_class_id => 3,
    :level => 10,
    :bab => 7, :base_fort => 5, :base_ref => 3, :base_will => 3,
    :defence_bonus => 5, :reputation_bonus => 3 },
])
