class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(args={})
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end

  def ratio
    @chainring / @cog.to_f
  end
  
  def gear_inches(diameter)
    ratio * diameter
  end

end

class Wheel
  attr_reader :rim, :tire

  def initialize(args={})
    @rim = args[:rim] || 24
    @tire = args[:tire] || 1.25
    @gear = args[:gear]
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end

  def gear_inches
    @gear.gear_inches(diameter)
  end

end

