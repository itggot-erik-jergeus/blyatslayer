class Swordfighter
  def initialize(name:, strength:, vitality:, speed:, luck:)
    @name = name
    @strength = strength
    @vitality = vitality
    @speed = speed
    @luck = luck
  end

  def health
    @health = 150.0 + @vitality * 20.0
  end
  def armor
    @armor = 1.0
  end
  def weapon
    @weapon = 1.0
  end
  def dodge_chance
    @dodge = 1.0 - 0.005 * @speed
  end
  def base_dmg
    @base_dmg = 30.0 + @strength * 10.0
  end
  def exp
    @experience = 0.0
  end
  def level
    @level = 1.0 + @experience / (100.0 + 50.0 * @level)
  end
end

class Ranger
  def initialize(name:, dexterity:, vitality:, agility:, luck:)
    @name = name
    @dexterity = dexterity
    @vitality = vitality
    @agility = agility
    @luck = luck
  end

  def health
    @health = 110.0 + @vitality * 15.0
  end
  def armor
    @armor = 1.0
  end
  def weapon
    @weapon = 1.0
  end
  def dodge_chance
    @dodge = 1.0 - 0.01 * @agility
  end
  def base_dmg
    @base_dmg = 30.0 + @dexterity * 10.0
  end
  def exp
    @experience = 0.0
  end
  def level
    @level = 1.0 + @experience / (100.0 + 50.0 * @level)
  end
end

class Sorcerer
  def initialize(name:, intelligence:, vitality:, willpower:, luck:)
    @name = name
    @intelligence = intelligence
    @vitality = vitality
    @willpower = willpower
    @luck = luck
    @health = 100.0 + @vitality * 12.5
    @armor = 1.0
    @weapon = 1.0
    @dodge = 1.0
    @base_dmg = 35.0 + @intelligence * 10.0
    @experience = 0.0
    @level = 1.0
  end


  def my_exp
    @experience
  end
  def my_level
    @level
  end
  def my_hp
    @health
  end
  def my_stats
    "#{name}s stats are the following: "
  end
end

Lorem = Sorcerer.new(name: "Lorem", intelligence: 2, vitality: 2, willpower: 2, luck: 4)
puts Lorem.hp
Lorem.hpup
puts Lorem.hp