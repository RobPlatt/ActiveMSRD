
class Hash
  def stack_bonus!(bonus_type, bonus_value)
    current_bonus = self[bonus_type]
    if (current_bonus == nil or current_bonus < bonus_value)
      self[bonus_type] = bonus_value
    end
  end
  
  def sum_bonuses()
    return values.inject(:+)
  end
end

class Character < ActiveRecord::Base
  has_many :character_levels, :dependent => :destroy
  has_many :class_levels, :through => :character_levels
  belongs_to :race
  has_many :character_skills, :dependent => :destroy
  has_many :skills, :through => :character_skills
  belongs_to :armor
  has_many :character_weapons, :dependent => :destroy
  has_many :weapons, :through => :character_weapons
  after_save :roll_hit_dice
  accepts_nested_attributes_for :character_weapons, :allow_destroy => true
  accepts_nested_attributes_for :character_skills, :reject_if => proc { |attributes| not attributes['ranks'].blank? and attributes['ranks'].to_i < 0 }
  accepts_nested_attributes_for :character_levels, :reject_if => proc { |attributes| attributes['class_level_id'].blank? }
  
  include Dice
  
  def <=>(other)
    if self.name < other.name
      return -1
    elsif self.name > other.name
      return 1
    else
      return 0
    end
  end
  
  def self.from_wiki_link(text)
    return find_by_name(text)
  end
  
  def to_param
    "#{id}-#{name.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
  end
  
  def each_level
    character_levels.sort.each{|x|yield x}
  end
  
  def each_class_level
    class_levels.sort.each{|x|yield x}
  end
  
  def effective_character_level
    return character_levels.count
  end
  
  def challenge_rating
    ecl = effective_character_level
    if (is_hero)
      return ecl
    elsif (ecl == 1)
      return "1/2"
    else
      return ecl - 1
    end
  end
  
  def roll_hit_dice
    each_level do
      |level|
      
      die = level.class_level.modern_class.hit_die
      
      if level.hit_die_roll == nil or level.hit_die_roll < 2 or level.hit_die_roll > die
        # hit die hasn't been rolled yet or has a weird value, roll it now
        
        # Heroes, but not ordinaries, get max hit points at level 1
        if level.level == 1 and is_hero
          level.update_attributes( :hit_die_roll => die )
        else
          level.update_attributes( :hit_die_roll => roll_d_with_reroll_1(die) ) 
        end
      end
      
    end
  end
  
  def hit_points
    hp = 0
    c = con_mod
    each_level do
      |level|
      if (level.hit_die_roll)
        hp = hp + level.hit_die_roll + c
      else
        hp = hp + 1 + c
      end
    end
    return hp
  end
  
  def speed
    base_speed = race.base_speed
    if armor
      if (race.base_speed == 30)
        return armor.speed
      else
        return (base_speed.to_f * (armor.speed.to_f / 30.0) / 5.0).round * 5
      end
    else
      return base_speed
    end
  end
  
  def size
    return race.size
  end
  
  def initiative
    return dex_mod
  end
  
  def self.score_to_mod(score)
    return (score - 10) / 2
  end
  
   def str_mod
    return Character.score_to_mod(str)
  end
  
  def dex_mod
    return Character.score_to_mod(dex)
  end

  def con_mod
    return Character.score_to_mod(con)
  end
  
  def int_mod
    return Character.score_to_mod(int)
  end
  
  def wis_mod
    return Character.score_to_mod(wis)
  end

  def cha_mod
    return Character.score_to_mod(cha)
  end
  
  def str
    return starting_str
  end
  
  def dex
    return starting_dex
  end

  def con
    return starting_con
  end
  
  def int
    return starting_int
  end
  
  def wis
    return starting_wis
  end

  def cha
    return starting_cha
  end
  
  def ability_mod(ability)
    return public_send(ability + "_mod")
  end
  
  def base_bonus(target)
    hash = {'nothing' => 0}
    each_class_level do |level|
      hash.stack_bonus!(level.modern_class.class_name, level.send(target))
    end
    return hash.sum_bonuses
  end
  
  def bab
    return base_bonus('bab')
  end
  
  def strength_check
    str_mod + race.strength_check_size_mod
  end
  
  def grapple
    return bab + strength_check
  end
  
  def defend_grapple
    return grapple + race.stability_mod
  end
  
  def start_trip
    return strength_check
  end
  
  def defend_trip
    if (dex_mod > str_mod)
      return dex_mod + race.strength_check_size_mod + race.stability_mod
    else
      return strength_check + race.stability_mod
    end
  end
  
  def bull_rush
    return strength_check
  end
  
  def defend_bull_rush
    return strength_check + race.stability_mod
  end
  
  def melee_attack
    return bab + str_mod + race.attack_size_mod
  end

  def ranged_attack
    return bab + dex_mod + race.attack_size_mod
  end
  
  def base_fort
    return base_bonus('base_fort')
  end

  def base_ref
    return base_bonus('base_ref')
  end
  
  def base_will
    return base_bonus('base_will')
  end
  
  def class_defence_bonus
    return base_bonus('defence_bonus')
  end
  
  def reputation
    return base_bonus('reputation_bonus')
  end
  
  def touch_defence
    dex_to_ac = dex_mod
    if armor
      if dex_to_ac > armor.max_dex_bonus
        dex_to_ac = armor.max_dex_bonus
      end
    end
    return class_defence_bonus + dex_to_ac + race.defence_size_mod
  end
  
  def equipment_defence_bonus
    # TODO: shields
    if armor
      #TODO: proficiency
      return armor.nonprof_bonus
    else
      return 0
    end
  end
  
  def defence
    return touch_defence + equipment_defence_bonus # TODO: natural armor
  end
  
  def fort
    return base_fort + con_mod
  end
  
  def ref
    return base_ref + dex_mod
  end
  
  def will
    return base_will + wis_mod
  end
  
  def skill_bonus(skill_id)
    skill = Skill.find(skill_id)
    bonus = ability_mod(skill.key_ability)
    
    # add on ranks in skill
    character_skill = character_skills.find_by_skill_id(skill_id)
    if (character_skill and character_skill.ranks and character_skill.ranks > 0)
      bonus = bonus + character_skill.ranks
    elsif (skill.trained_only)
      bonus = nil # skill is trained only and character has no ranks
    end
    
    if bonus and skill.armor_penalty and armor
      bonus = bonus - armor.armor_penalty
    end
    
    return bonus
  end
  
  def is_class_skill(skill_id)
    class_levels.each do |level|
      if ClassSkill.find_by_modern_class_id_and_skill_id(level.modern_class_id, skill_id)
        return true
      end
    end
    return false
  end
  
  def max_class_skill_rank
    return character_levels.count + 3
  end
  
  def max_cross_class_skill_rank
    return max_class_skill_rank / 2
  end
  
  def level_choices
    return ClassLevel.all
  end
  
 def skill_points_available
    total = 0
    class_levels.each do |level|
      if (level.modern_class)
        points = level.modern_class.skill_points + Character.score_to_mod(starting_int)
        if race.name == 'human'
          points = points + 1
        end
        if (level.level == 1)
          total = total + points*4
        else
          total = total + points
        end
      end
    end
    character_skills.each do |skill|
      if (skill.ranks)
        total = total - skill.ranks
      end
    end
    return total
  end
  
end
