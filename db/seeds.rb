# This file should contain all the record creation needed to seed the database with its default values.
#
# All MSRD content should go in here.
#

Skill.seed( [
  {:skill_name => 'balance', :key_ability => 'dex', :armor_penalty => 'true' },
  {:skill_name => 'bluff', :key_ability => 'cha'},
  {:skill_name => 'Climb', :key_ability => 'str', :armor_penalty => 'true' },
  {:skill_name => 'Computer Use', :key_ability => 'int' },
  {:skill_name => 'Concentration', :key_ability => 'con' },
  {:skill_name => 'Craft (chemical)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Craft (electronic)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Craft (mechanical)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Craft (pharmaceutical)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Craft (structural)', :key_ability => 'int' },
  {:skill_name => 'Craft (visual art)', :key_ability => 'int' },
  {:skill_name => 'Craft (writing)', :key_ability => 'int' },
  {:skill_name => 'Decipher Script', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Demolitions', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Diplomacy', :key_ability => 'cha' },
  {:skill_name => 'Disable Device', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Disguise', :key_ability => 'cha' },
  {:skill_name => 'Drive', :key_ability => 'dex' },
  {:skill_name => 'Escape Artist', :key_ability => 'dex' },
  {:skill_name => 'Forgery', :key_ability => 'int' },
  {:skill_name => 'Gamble', :key_ability => 'wis' },
  {:skill_name => 'Gather Information', :key_ability => 'cha' },
  {:skill_name => 'Handle Animal', :key_ability => 'cha' },
  {:skill_name => 'Hide', :key_ability => 'dex', :armor_penalty => 'true' },
  {:skill_name => 'Intimidate', :key_ability => 'cha' },
  {:skill_name => 'Investigate', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Jump', :key_ability => 'str', :armor_penalty => 'true' },
  {:skill_name => 'Knowledge (Arcane Lore)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Art)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Behavioral Sciences)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Business)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Civics)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Current Events)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Earth and Life Sciences)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (History)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Physical Sciences)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Popular Culture)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Streetwise)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Tactics)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Technology)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Knowledge (Theology)', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Listen', :key_ability => 'wis' },
  {:skill_name => 'Move Silently', :key_ability => 'dex', :armor_penalty => 'true' },
  {:skill_name => 'Navigate', :key_ability => 'int' },
  {:skill_name => 'Perform (Act)', :key_ability => 'cha' },
  {:skill_name => 'Perform (Dance)', :key_ability => 'cha' },
  {:skill_name => 'Perform (Keyboards)', :key_ability => 'cha' },
  {:skill_name => 'Perform (Percussion Instruments)', :key_ability => 'cha' },
  {:skill_name => 'Perform (Sing)', :key_ability => 'cha' },
  {:skill_name => 'Perform (Stand-Up)', :key_ability => 'cha' },
  {:skill_name => 'Perform (Stringed Instruments)', :key_ability => 'cha' },
  {:skill_name => 'Perform (Wind Instruments)', :key_ability => 'cha' },
  {:skill_name => 'Pilot', :key_ability => 'dex', :trained_only => true },
  {:skill_name => 'Profession', :key_ability => 'wis' },
  {:skill_name => 'Read/Write Language', :key_ability => 'none', :trained_only => true },
  {:skill_name => 'Repair', :key_ability => 'int', :trained_only => true },
  {:skill_name => 'Research', :key_ability => 'int' },
  {:skill_name => 'Ride', :key_ability => 'dex' },
  {:skill_name => 'Search', :key_ability => 'int' },
  {:skill_name => 'Sense Motive', :key_ability => 'wis' },
  {:skill_name => 'Sleight of Hand', :key_ability => 'dex', :trained_only => true, :armor_penalty => 'true' },
  {:skill_name => 'Speak Language', :key_ability => 'none', :trained_only => true },
  {:skill_name => 'Spot', :key_ability => 'wis' },
  {:skill_name => 'Survival', :key_ability => 'wis' },
  {:skill_name => 'Swim', :key_ability => 'str', :armor_penalty => 'true' },
  {:skill_name => 'Treat Injury', :key_ability => 'wis' },
  {:skill_name => 'Tumble', :key_ability => 'dex', :trained_only => true, :armor_penalty => 'true' }
    ])

Race.find_or_create_by_name(:name => 'human')
Race.find_or_create_by_name(:name => 'gnome').update_attributes(
  { :name => 'gnome', :base_speed => 20, :size => 'small'})
             
ModernClass.find_or_create_by_class_name(:class_name => 'Strong Hero').update_attributes(
  {
    :primary_stat => 'strength',
    :bab => 'full',
    :good_fort => true,
    :defence_bonus => 'average',
    :reputation_bonus => 'poor',
    :skill_points => 2,
    :action_points => 5,
    :hit_die => 8
  })

ModernClass.find_or_create_by_class_name(:class_name => 'Fast Hero').update_attributes(
  {
    :primary_stat => 'dexterity',
    :bab => 'three-quarters',
    :good_ref => true,
    :defence_bonus => 'excellent',
    :reputation_bonus => 'average',
    :skill_points => 4,
    :action_points => 5,
    :hit_die => 8
  })

ModernClass.find_or_create_by_class_name(:class_name => 'Tough Hero').update_attributes(
  {
    :primary_stat => 'constitution',
    :bab => 'three-quarters',
    :good_fort => true,
    :defence_bonus => 'average',
    :reputation_bonus => 'average',
    :skill_points => 2,
    :action_points => 5,
    :hit_die => 10
  })

ModernClass.find_or_create_by_class_name(:class_name => 'Smart Hero').update_attributes(
  {
    :primary_stat => 'intelligence',
    :bab => 'half',
    :good_will => true,
    :defence_bonus => 'poor',
    :reputation_bonus => 'good',
    :skill_points => 8,
    :action_points => 5,
    :hit_die => 6
  })
  
ModernClass.find_or_create_by_class_name(:class_name => 'Dedicated Hero').update_attributes( 
  {
    :primary_stat => 'wisdom',
    :bab => 'three-quarters',
    :good_fort => true,
    :good_will => true,
    :defence_bonus => 'average',
    :reputation_bonus => 'good',
    :skill_points => 4,
    :action_points => 5,
    :hit_die => 6
  })

ModernClass.find_or_create_by_class_name(:class_name => 'Charismatic Hero').update_attributes(
  {
    :primary_stat => 'charisma',
    :bab => 'half',
    :good_fort => true,
    :good_ref => true,
    :defence_bonus => 'poor',
    :reputation_bonus => 'excellent',
    :skill_points => 6,
    :action_points => 5,
    :hit_die => 6
  })

ClassLevel.seed('Strong Hero',
  [
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { }
  ])

ClassLevel.seed('Fast Hero',
  [
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { }
  ])
  
ClassLevel.seed('Tough Hero',
  [
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { }
  ])
  
ClassLevel.seed('Smart Hero',
  [
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { }
  ])
  
ClassLevel.seed('Dedicated Hero',
  [
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { }
  ])
  
ClassLevel.seed('Charismatic Hero',
  [
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { },
  { }
  ])
  

=begin
ClassLevel.find_or_create_by_modern_class_id_and_level([
  ###################
  # The Strong Hero #
  ###################
  { :modern_class_id => modern_class.find_by_name('Strong Hero'),
    :level => 1,
    :bab => 1, :base_fort => 1, :base_ref => 0, :base_will => 0,
    :defence_bonus => 1, :reputation_bonus => 0 },
    
  { :modern_class_id => modern_class.find_by_name('Strong Hero'),
    :level => 2,
    :bab => 2, :base_fort => 2, :base_ref => 0, :base_will => 0,
    :defence_bonus => 2, :reputation_bonus => 0 },

  { :modern_class_id => modern_class.find_by_name('Strong Hero'),
    :level => 3,
    :bab => 3, :base_fort => 2, :base_ref => 1, :base_will => 1,
    :defence_bonus => 2, :reputation_bonus => 0 },

  { :modern_class_id => modern_class.find_by_name('Strong Hero'),
    :level => 4,
    :bab => 4, :base_fort => 3, :base_ref => 1, :base_will => 1,
    :defence_bonus => 3, :reputation_bonus => 0 },

  { :modern_class_id => modern_class.find_by_name('Strong Hero'),
    :level => 5,
    :bab => 5, :base_fort => 3, :base_ref => 1, :base_will => 1,
    :defence_bonus => 3, :reputation_bonus => 1 },

  { :modern_class_id => modern_class.find_by_name('Strong Hero'),
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
=end