module WeaponsHelper
  
  def rate_of_fire_descriptive(rate_of_fire)
    str = ""
    if rate_of_fire == 'Single'
      str = "<b>Single Shot:</b> A weapon with the single shot rate of fire requires the user to manually operate the action (the mechanism that feeds and cocks the weapon) between each shot. Pump shotguns and bolt-action rifles are examples of firearms with single shot rates of fire. A weapon with the single shot rate of fire can fire only one shot per attack, even if the user has a feat or other ability that normally allow more than one shot per attack."
    else
      if rate_of_fire.include?('S')
        str = str + "<b>Semiautomatic (S)</b>: These firearms feed and cock themselves with each shot. A semiautomatic weapon fires one shot per attack (effectively acting as a single shot weapon), but some feats allow characters armed with semiautomatic weapons to fire shots in rapid successions, getting in more than one shot per attack."
      end
      if rate_of_fire.include?('S') and rate_of_fire.include?('A')
        str = str + '<br>'
      end
      if rate_of_fire.include?('A')
        str = str + "<b>Automatic (A)</b>: Automatic weapons fire a burst or stream of shots with a single squeeze of the trigger. Only weapons with the automatic rate of fire can be set on autofire or be used with feats that take advantage of automatic fire."
      end
    end

    return str
  end
  
end
