require 'forwardable'
require 'ostruct'

class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select { |part| part.needs_spare }
  end
end

module PartsFactory
  def self.build(config, parts_class = Parts)
    parts_class.new(config.collect { |part_config|
      create_part(part_config) } )
  end

  def self.create_part(part_config)
    OpenStruct.new(name: part_config[0],
                   description: part_config[1],
                   needs_spare: part_config.fetch(2, true))
  end
end

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

road_config = [
  ['chain', '10-speed'],
  ['tire_size', '23'],
  ['tape_color', 'red']]

mountain_config = [
  ['chain', '10-speed'],
  ['tire_size', '2.1'],
  ['front_shock', 'Manitou', false],
  ['rear_shock', 'Fox']]

