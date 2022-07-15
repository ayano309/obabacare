module VitalHelper
  #case文でできる方法知りたい
  def check_temprature(vital)
    if vital.temperature >= 38
      return 'red'
    elsif vital.temperature <= 35
      return 'blue'
    end
  end

  def check_high_bp(vital)
    if (vital.high_bp >= 140)
      return 'red'
    elsif (vital.high_bp <= 100)
      return 'blue'
    end
  end

  def check_low_bp(vital)
    if (vital.low_bp >= 90)
      return 'red'
    elsif (vital.low_bp <= 60)
      return 'blue'
    end
  end

  def check_pulse(vital)
    if (vital.pulse >= 100)
      return 'red'
    elsif (vital.pulse <= 60)
      return 'blue'
    end
  end

  def check_breathing(vital)
    if (vital.breathing > 28)
      return 'red'
    elsif (vital.breathing < 12)
      return 'blue'
    end
  end

  def check_oxygen_saturation(vital)
    if (vital.oxygen_saturation > 99)
      return 'red'
    elsif (vital.oxygen_saturation  < 96)
      return 'blue'
    end
  end

  def moisture_supply_check(vital)
    if vital.moisture_supply >= 2000
      return '飲み過ぎです' 
    elsif vital.moisture_supply <= 1000
      return 'もっと飲んでください'
    end
  end
end
