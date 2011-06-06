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
    hash.each {|c, l|
      a.push(link_to(c, modern_class_path(ModernClass.find_by_class_name(c))) + " " + l.to_s)}
    str = link_to(character.race.name.capitalize, race_path(character.race)) + " " + raw(a.join("/"))
    if not character.is_hero
      str = "Ordinary " + str
    end
    
    return str
  end
end
