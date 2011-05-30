module Dice
  
  def roll_d(faces)
    if (faces == nil or faces < 2)
      return 1
    else
      return 1 + rand(faces)
    end
  end
  
  def roll_d_with_reroll_1(faces)
    if (faces == nil or faces < 2)
      return 1
    end
      
    while(true) do
      result = 1 + rand(faces)
      if (result > 1)
        return result
      end
    end
  end
    
  def roll_ability_score(dice_to_drop)
    tries = []
    for i in (1..3+dice_to_drop)
      tries.push(self.roll_d(6))
    end
    tries.sort!
    return tries.drop(dice_to_drop).inject(:+)
  end
  
  def roll_ability_scores(dice_to_drop, scores_to_drop)
    scores = []
    for i in (1..6+scores_to_drop)
      scores.push(self.roll_ability_score(dice_to_drop))
    end
    scores.sort!
    return scores.drop(scores_to_drop)
  end

end