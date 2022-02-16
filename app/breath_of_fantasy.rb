require './warriors/warrior.rb'
require './battle/battle_field.rb'

class BreathOfFantasy
  def call
    begin
      puts "Breath of Fantasy"
      puts "================"
      prepare_warriors
      start_battle
    rescue ArgumentError => e
      puts "#{e.message} Tente novamente"
      puts "================"
      BreathOfFantasy.new.call
    end
  end

  private

  def prepare_warriors
    puts "Crie um guerreiro: [Nome] [Energia] [Poder]"
    @first_warrior  = create_warrior
    puts "Crie seu adversário: [Nome] [Energia] [Poder]"
    @second_warrior = create_warrior
  end

  def create_warrior
    Warrior.new(warrior_values)
  end

  def start_battle
    BattleField.new(
      @first_warrior,
      @second_warrior
    ).start
  end

  def warrior_values
    gets.chomp.split(' ')
  end
end

BreathOfFantasy.new.call
