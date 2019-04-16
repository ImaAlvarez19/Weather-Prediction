class Planet
  attr_accessor :angular_speed, :angle_position, :sun_distance, :point

  def initialize(angular_speed:, angle_position:, sun_distance:)
    @angular_speed = angular_speed
    @angle_position = angle_position
    @sun_distance = sun_distance
  end

  def angle_day(day)
    angle = angle_position + (angular_speed * day)
    if angle.abs >= 360.0
      if angle > 0.0
        angle -= 360.0
      else
        angle += 360.0
      end
    end
    angle
  end

  def cartesian_position
    radians = angle_position * Math::PI / 180
    coordinate_x = Math.cos(radians) * sun_distance
    coordinate_y = Math.sin(radians) * sun_distance
    @point = Point.new(x: coordinate_x, y: coordinate_y)
  end
end
