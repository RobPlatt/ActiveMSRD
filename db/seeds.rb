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
  {:skill_name => 'Knowledge (Theology and Philosophy)', :key_ability => 'int', :trained_only => true },
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
    
puts "Seeding MSRD equipment..."
puts "  Armor..."
Armor.seed('db/armor.csv')
puts "  Ranged weapons..."
Weapon.seed_ranged('db/ranged_weapons.csv')

puts "Seeding MSRD feats..."
Feat.seed('db/feats.txt')

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
ClassLevel.seed(strong_hero,
  [
  { },
  { :bonus_feat => true },
  { },
  { :bonus_feat => true },
  { },
  { :bonus_feat => true },
  { },
  { :bonus_feat => true },
  { },
  { :bonus_feat => true }
  ])
ClassSkill.seed(strong_hero,
"Climb (Str), Craft (structural) (Int), Handle Animal (Cha), Jump (Str), Knowledge (current events, popular culture, streetwise, tactics) (Int), Profession (Wis), Read/Write Language (none), Repair (Int), Speak Language (none), and Swim (Str)"
)

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
ClassSkill.seed(fast_hero,
"Balance (Dex), Craft (mechanical) (Int), Drive (Dex), Escape Artist (Dex), Hide (Dex), Knowledge (current events, popular culture, streetwise) (Int), Move Silently (Dex), Pilot (Dex), Profession (Wis), Read/Write Language (none), Ride (Dex), Sleight of Hand (Dex), Speak Language (none), and Tumble (Dex)."
)

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
ClassSkill.seed(tough_hero,
"Climb (Str), Concentration (Con), Craft (mechanical, structural) (Int), Drive (Dex), Intimidate (Cha), Knowledge (current events, popular culture, streetwise) (Int), Profession (Wis), Read/Write Language (none), Ride (Dex), Speak Language (none), Spot (Wis), and Survival (Wis)"
)
  
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
ClassSkill.seed(smart_hero,
"Computer Use (Int), Craft (chemical, electronic, mechanical, pharmaceutical, structural, visual art, writing) (Int), Decipher Script (Int), Demolitions (Int), Disable Device (Int), Forgery (Int), Investigate (Int), Knowledge (arcane lore, art, behavioral sciences, business, civics, current events, earth and life sciences, history, physical sciences, popular culture, streetwise, tactics, technology, theology and philosophy) (Int), Navigate (Int), Profession (Wis), Read/Write Language (none), Repair (Int), Research (Int), Search (Int), and Speak Language (none)."
)

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
ClassSkill.seed(dedicated_hero,
"Craft (pharmaceutical, visual art, writing) (Int), Gamble (Wis), Investigate (Int), Knowledge (arcane lore, art, behavioral sciences, business, civics, current events, earth and life sciences, history, physical sciences, popular culture, streetwise, tactics, technology, theology and philosophy) (Int), Listen (Wis), Profession (Wis), Read/Write Language (none), Sense Motive (Wis), Speak Language (none), Spot (Wis), Survival (Wis), and Treat Injury (Wis")

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
ClassSkill.seed(charismatic_hero,
"Bluff (Cha), Craft (visual art, writing) (Int), Diplomacy (Cha), Disguise (Cha), Gather Information (Cha), Handle Animal (Cha), Intimidate (Cha), Knowledge (arcane lore, art, behavioral sciences, business, civics, current events, popular culture, streetwise, theology and philosophy) (Int), Perform (act, dance, keyboards, percussion instruments, sing, stand-up, stringed instruments, wind instruments) (Cha), Profession (Wis), Read/Write Language (none), and Speak Language (none")
puts "Seeding test characters..."

tony_test = Character.find_or_create_by_name(:name => 'Tony Test')
scores = roll_ability_scores(1, 4)
tony_test.update_attributes({
  :description => "A test _heroic_ character. Friend of [JD][character:John Doe Test]",
  :is_hero => true,
  :starting_dex => scores.pop,
  :starting_con => scores.pop,
  :starting_str => scores.pop,
  :starting_int => scores.pop,
  :starting_cha => scores.pop,
  :starting_wis => scores.pop})
CharacterLevel.seed(tony_test, [
  {:class_level_id => strong_hero.level(1).id},
  {:class_level_id => strong_hero.level(2).id},
  {:class_level_id => fast_hero.level(1).id},
  {:class_level_id => fast_hero.level(2).id},
  {:class_level_id => strong_hero.level(3).id}
])
tony_test.roll_hit_dice

jdoe_test = Character.find_or_create_by_name(:name => 'John Doe Test')
scores = ordinary_ability_scores
jdoe_test.update_attributes({
  :description => 'A test ordinary, and rather [religious][modern_class:Dedicated Hero] character',
  :starting_wis => scores.pop,
  :starting_cha => scores.pop,
  :starting_int => scores.pop,
  :starting_con => scores.pop,
  :starting_dex => scores.pop,
  :starting_str => scores.pop})
CharacterLevel.seed(jdoe_test, [
  {:class_level_id => dedicated_hero.level(1).id}
])
jdoe_test.roll_hit_dice
