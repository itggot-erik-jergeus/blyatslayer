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
    @actions = ["&attack", "&block"]
  end
  def health
    @health = 100.0 + @vitality * 12.5
  end
  def armor
    @armor = 1.0
  end
  def weapon
    @weapon = 1.0
  end
  def dodge_chance
    @dodge = 1.0
  end
  def base_dmg
    @base_dmg = 35.0 + @intelligence * 10.0
  end
  def exp
    @experience = 0.0
  end
  def level
    @level = 1.0 + @experience / (100.0 + 50.0 * @level)
  end
  def actions
    @actions.each_with_index do |action,index|
      if @combat
        if action[0] == "&"
          puts "#{index+1}: #{action}"
        end
      else
        puts "#{index+1}: #{action}"
      end
    end
  end

  def combat(player:, opponent:, player_health=player.health, opponent_health=opponent.health)
    @combat = true
    if player_health > 0 || opponent_health > 0
      puts "Your opponents health is #{opponent_health}!"
      puts "Your health is #{player_health}!"
      player.actions
      option = gets.chomp
      if option == "1"
        opponent_health -= player.base_dmg*player.weapon/opponent.armor
        player_health -= opponent.base_dmg*opponent.weapon/player.armor
        player.combat(player:player, opponent:opponent,player_health:player_health,opponent_health:opponent_health)
      elsif option == "2"
        player_health -= opponent.base_dmg*opponent.weapon/(player.armor*5)
        player.combat(player:player, opponent:opponent,player_health:player_health,opponent_health:opponent_health)
      end
    elsif player_health < 0
      puts "You dieded"
    elsif opponent_health < 0
      puts "You killed the scrub blyat!"
    end
    @combat = false
    end
end

Lorem = Sorcerer.new(name: "Lorem", intelligence: 2, vitality: 2, willpower: 2, luck: 4)
Lorem.combat(player: Lorem,opponent: Lorem)