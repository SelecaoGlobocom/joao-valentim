require './warriors/warrior.rb'
require './battle/battle_field.rb'

class BreathOfFantasy
  def call
    begin
      puts "Breath of Fantasy"
      puts "================"
      puts "Crie um guerreiro: [Nome] [Energia] [Poder]"
      @first_warrior  = Warrior.new(warrior_values)
      puts "Crie seu adversário: [Nome] [Energia] [Poder]"
      @second_warrior = Warrior.new(warrior_values)
      BattleField.new(
        @first_warrior,
        @second_warrior
      ).start
    rescue ArgumentError => e
      puts "#{e.message} Tente novamente"
      puts "================"
      BreathOfFantasy.new.call
    end
  end

  def warrior_values
    gets.chomp.split(' ')
  end
end

BreathOfFantasy.new.call
