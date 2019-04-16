require 'singleton'
class SolarSystem
  include Singleton
  attr_reader :planets, :sun_position
  DAYS_YEAR = 360

  def initialize
    @sun_position = Point.new(x: 0.0, y: 0.0)
    @planets = []
    planets << Planet.new(angular_speed: -1.0, angle_position: 0.0, sun_distance: 500.0)
    planets << Planet.new(angular_speed: -3.0, angle_position: 0.0, sun_distance: 2000.0)
    planets << Planet.new(angular_speed: 5.0, angle_position: 0.0, sun_distance: 1000.0)
  end
end
