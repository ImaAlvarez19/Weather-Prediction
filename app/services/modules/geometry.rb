module Modules
  module Geometry
    attr_accessor :point

    def position(distance, angle)
      radians = angle * Math::PI / 180
      coordinate_x = (Math.cos(radians) * distance).round(2)
      coordinate_y = (Math.sin(radians) * distance).round(2)
      @point = Point.new(x: coordinate_x, y: coordinate_y)
    end

    def calculate_perimeter_from_points(points)
      perimeter = 0
      return perimeter if points.size < 3

      points.each_with_index do |point, index|
        next_point = points[index + 1]
        break if next_point.blank?

        perimeter += calculate_distance_between_two_points(point, next_point)
      end
      perimeter += calculate_distance_between_two_points(points.last, points.first)
    end

    def calculate_distance_between_two_points(point1, point2)
      potencia1 = (point1.x - point2.x)**2
      potencia2 = (point1.y - point2.y)**2
      Math.sqrt(potencia1 + potencia2)
    end

    def are_aligned?(points)
      return true if points.size < 3

      p1 = points.first
      p2 = points.second
      pendiente = (p2.y - p1.y) / (p2.x - p1.x).to_f
      # verify if all next points are aligned in the equition of the line.
      points[2..points.size].each do |point|
        left_side_equation = point.y - p1.y
        right_side_equation = pendiente * (point.x - p1.y)
        # to be aligned both side of the equation must be equals.
        return false if left_side_equation != right_side_equation
      end
      true
    rescue ZeroDivisionError => e
      'Error Zero'
    end

    def point_in_the_figure?(figure_points, point)
      return if figure_points.size < 3

      point1 = figure_points[0]
      point2 = figure_points[1]
      flag_point_side = calculate_point_side(point1, point2, point).negative?
      previos_point = point2
      figure_points[2..figure_points.size].each do |figure_point|
        flag_point_side2 = calculate_point_side(previos_point, figure_point, point).negative?
        return false if flag_point_side != flag_point_side2

        previos_point = figure_point
      end
      flag_point_side2 = calculate_point_side(previos_point, point1, point).negative?
      flag_point_side && flag_point_side2
    end

    private

    def calculate_point_side(point1, point2, point)
      (point.x - point2.x) * (point1.y - point2.y) - (point1.x - point2.x) * (point.y - point2.y)
    end
  end
end
