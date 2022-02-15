class Damage
  def initialize(warrior)
    @lucky_factor = Random.rand(0..100)
    @warrior      = warrior
  end

  def calculate_damage
    case @lucky_factor
    when 0..15
      missing_damage
    when 16..70 
      normal_damage
    when 71..96
      lucky_damage
    when 97..100
      critical_damage
    end
    @amount
  end

  private

  def missing_damage
    set_ammount(0)

    puts "Errou - #{@amount} HP"
  end

  def normal_damage
    set_ammount((@warrior.power / 1/3))

    puts "Normal - #{@amount} HP"
  end

  def lucky_damage
    common_damage = (@warrior.power / 1/3)
    common_damage += (common_damage * 1/5)
    set_ammount(common_damage)

    puts "Sorte!!! - #{@amount} HP"
  end

  def critical_damage
    set_ammount((@warrior.power / 1/3) * 2)
    puts "Crítico! - #{@amount} HP"
  end

  def set_ammount(amount)
    @amount = amount
  end
end