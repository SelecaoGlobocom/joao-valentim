class Warrior
  attr_accessor :name, :energy, :power

  def initialize(args)
    @name   = validates_name(args[0])
    @energy = validates_energy(args[1])
    @power  = validates_power(args[2])
  end

  private

  def validates_name(name)
    return check_name(name)
    raise ArgumentError, "Um guerreiro precisa de um nome!"
  end

  def validates_energy(energy)
    return check_string(energy)
    raise ArgumentError, "Um guerreiro precisa de energia!"
  end

  def validates_power(power)
    return check_string(power)
    raise ArgumentError, "Um guerreiro precisa de poder!"
  end

  def check_string(string)
    raise ArgumentError, "Valor inválido para um poder ou energia de um guerreiro!" unless (!string.nil? && !string.empty? && string.scan(/\D/).empty?)
    return_valid_value(string)
  end
  
  def return_valid_value(value)
    value.to_i >= 10 ? value.to_i : (raise ArgumentError, "Valor mínimo para um poder ou energia de um guerreiro deve ser igual ou maior que 10!")
  end

  def check_name(string)
    raise ArgumentError, "Valor inválido para um nome de um guerreiro!" if (!string.nil? && !string.empty? && string.scan(/\D/).empty?)
    string
  end

end
