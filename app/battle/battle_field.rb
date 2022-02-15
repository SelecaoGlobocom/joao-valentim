require './battle/damage.rb'

class BattleField
  def initialize(first_warrior, second_warrior)
    @first_warrior  = first_warrior
    @second_warrior = second_warrior
  end

  def start
    puts "O jogo começou!"
    puts "Batalha entre #{@first_warrior.name} e #{@second_warrior.name}!"
    puts "================"
    battle_rounds
    battle_winner
    puts "================"
  end

  private

  def battle_rounds
    while @first_warrior.energy > 0 && @second_warrior.energy > 0
      break if first_round <= 0 || second_round <= 0
    end
  end

  def first_round
    puts "#{@second_warrior.name} atacou #{@first_warrior.name}!"
    
    return 0 if @first_warrior.energy < 0
    @first_warrior.energy -= damage(@second_warrior)
  end

  def second_round
    puts "#{@first_warrior.name} atacou #{@second_warrior.name}!"
    
    return 0 if @second_warrior.energy < 0
    @second_warrior.energy -= damage(@first_warrior)
  end

  def battle_winner
    if @first_warrior.energy > 0
      puts "O jogo acabou, o vencedor foi #{@first_warrior.name} com HP restante de #{@first_warrior.energy}!"
    else
      puts "O jogo acabou, o vencedor foi #{@second_warrior.name} com HP restante de #{@second_warrior.energy}!"
    end
  end

  def damage(warrior)
    Damage.new(warrior).calculate_damage
  end
end