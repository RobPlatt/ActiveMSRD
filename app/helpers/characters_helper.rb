module CharactersHelper
  
  def show_skill_bonus(bonus)
    if (bonus)
      return '%+d' % bonus
    else
      return 'untrained'
    end
  end
  
  def show_build(character)
    hash = {}
    character.each_class_level do |level|
      hash.stack_bonus!(level.modern_class.class_name, level.level)
    end
    a = []
    hash.each {|c, l| a.push(c + " " + l.to_s)}
    str = character.race.name.capitalize + " " + a.join("/")
    if (not character.is_hero)
      str = "Ordinary " + str
    end
    
    return str
  end
end
