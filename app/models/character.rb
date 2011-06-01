
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
  has_many :character_skills, :dependent => :restrict
  has_many :skills, :through => :character_skills
  accepts_nested_attributes_for :character_skills
  
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
    return race.base_speed
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
  
  def armor_penalty
    return 0
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
    return class_defence_bonus + dex_mod + race.defence_size_mod
  end
  
  def defence
    return touch_defence # TODO equipment, natural armor
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
  
  def skill_bonus(skill_name)

    skill = Skill.find_by_skill_name(skill_name)
    bonus = ability_mod(skill.key_ability) + armor_penalty
    
    # add on ranks in skill
    character_skill = character_skills.find_by_skill_id(skill)
    if (character_skill)
      bonus = bonus + character_skill.ranks
    elsif (skill.trained_only)
      bonus = nil # skill is trained only and character has no ranks
    end
    
    return bonus
  end
  
end
