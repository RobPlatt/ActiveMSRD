# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Race.create([
  { :name => 'human'}])
Race.create([
  { :name => 'gnome'},
  { :base_speed => 20},
  { :size => 'small'}])
             
ModernClass.create([
  { :class_name => 'Strong Hero'},
  { :skill_points => 2 },
  { :action_points => 5 },
  { :hit_die => 8 }
                   ])

ModernClass.create([
  { :class_name => 'Fast Hero'},
  { :skill_points => 4 },
  { :action_points => 5 },
  { :hit_die => 8 }
                   ])

ModernClass.create([
  { :class_name => 'Tough Hero'},
  { :skill_points => 2 },
  { :action_points => 5 },
  { :hit_die => 10 }
                   ])

ModernClass.create([
  { :class_name => 'Smart Hero'},
  { :skill_points => 8 },
  { :action_points => 5 },
  { :hit_die => 6 }
                   ])

ModernClass.create([
  { :class_name => 'Fast Hero'},
  { :skill_points => 4 },
  { :action_points => 5 },
  { :hit_die => 6 }
                   ])

ModernClass.create([
  { :class_name => 'Charismatic Hero'},
  { :skill_points => 6 },
  { :action_points => 5 },
  { :hit_die => 6 }
                   ])
