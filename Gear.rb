class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    @chainring / @cog.to_f
  end
  
  def gear_inches
    ratio * diameter
  end

  def diameter
    @wheel.diameter
  end

end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

