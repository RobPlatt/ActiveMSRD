# This file should contain all the record creation needed to seed the database with its default values.
#
# All MSRD content should go in here.
#

# include Dice to allow autogeneration of random characters
include Dice

puts "Seeding MSRD skills..."

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

puts "Seeding MSRD races..."

Race.find_or_create_by_name(:name => 'human')
Race.find_or_create_by_name(:name => 'gnome').update_attributes(
  { :name => 'gnome', :base_speed => 20, :size => 'small'})
  
  
puts "Seeding MSRD classes..."
             
strong_hero = ModernClass.find_or_create_by_class_name(:class_name => 'Strong Hero')
strong_hero.update_attributes(
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

ClassSkill.seed(strong_hero,
[ 'Climb', 'Craft (structural)', 'Handle Animal', 'Jump',
  'Knowledge (Current events)', 'Knowledge (Popular Culture',
  'Knowledge (Streetwise)', 'Knowledge (Tactics)',
  'Profession', 'Read/Write Language', 'Repair', 'Speak Language', 'Swim' ])

ClassLevel.seed(strong_hero,
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

fast_hero = ModernClass.find_or_create_by_class_name(:class_name => 'Fast Hero')
fast_hero.update_attributes(
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
ClassLevel.seed(fast_hero,
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
  
tough_hero = ModernClass.find_or_create_by_class_name(:class_name => 'Tough Hero')
tough_hero.update_attributes(
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
ClassLevel.seed(tough_hero,
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
 
smart_hero = ModernClass.find_or_create_by_class_name(:class_name => 'Smart Hero')
smart_hero.update_attributes(
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
ClassLevel.seed(smart_hero,
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
  
dedicated_hero = ModernClass.find_or_create_by_class_name(:class_name => 'Dedicated Hero')
dedicated_hero.update_attributes( 
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
ClassLevel.seed(dedicated_hero,
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

charismatic_hero = ModernClass.find_or_create_by_class_name(:class_name => 'Charismatic Hero')
charismatic_hero.update_attributes(
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
ClassLevel.seed(charismatic_hero,
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
  

puts "Seeding test characters..."

tony_test = Character.find_or_create_by_name(:character_name => 'Tony Test')
#scores = roll_ability_scores(1, 4)
#tony_test.update_attributes({
#  :description => 'A test character',
#  :starting_dex => scores.pop,
#  :starting_con => scores.pop,
#  :starting_str => scores.pop,
#  :starting_int => scores.pop,
#  :starting_cha => scores.pop,
#  :starting_wis => scores.pop})
CharacterLevel.seed(tony_test, [
  {:class_level_id => strong_hero.level(1).id},
  {:class_level_id => strong_hero.level(2).id},
  {:class_level_id => fast_hero.level(1).id},
  {:class_level_id => fast_hero.level(2).id},
  {:class_level_id => strong_hero.level(3).id}
])
tony_test.roll_hit_dice
