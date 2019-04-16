require 'rails_helper'
RSpec.describe 'Modules::Geometry' do
  let(:geometry) { Class.new { extend Modules::Geometry } }
  it 'get position when angle is 0' do
    distance = 300
    angle = 0
    point = geometry.position(distance, angle)
    expect(point.x).to eq(distance)
    expect(point.y).to eq(0.0)
  end

  it 'get position when angle is 30' do
    distance = 300
    angle = 30
    point = geometry.position(distance, angle)
    expect(point.y).to be < point.x
    expect(point.y).to eq(150.0)
  end

  it 'get position when angle is 60' do
    distance = 300
    angle = 60
    point = geometry.position(distance, angle)
    expect(point.x).to be < point.y
    expect(point.x).to be > 0.0
    expect(point.y).to be > 0.0
    expect(point.x).to eq(150.0)
  end

  it 'get position when angle is 90' do
    distance = 300
    angle = 90
    point = geometry.position(distance, angle)
    expect(point.x).to eq(0.0)
    expect(point.y).to eq(distance)
  end

  it 'get position when angle is 120' do
    distance = 300
    angle = 120
    point = geometry.position(distance, angle)
    expect(point.y).to be > 0.0
    expect(point.x).to be < 0.0
    expect(point.x).to eq(-150.0)
  end

  it 'get position when angle is 210' do
    distance = 300
    angle = 210
    point = geometry.position(distance, angle)
    expect(point.x).to be < 0.0
    expect(point.y).to be < 0.0
    expect(point.y).to eq(-150.0)
  end

  it 'get position when angle is 330' do
    distance = 300
    angle = 330
    point = geometry.position(distance, angle)
    expect(point.x).to be > 0.0
    expect(point.y).to be < 0.0
    expect(point.y).to eq(-150.0)
  end

  it 'get position when angle is 360' do
    distance = 300
    angle = 360
    point = geometry.position(distance, angle)
    expect(point.x).to eq(distance)
    expect(point.y).to eq(0.0)
  end

  it 'calculate distance between 2 points Y Zero Success' do
    p1 = Point.new(x: -10, y: 0)
    p2 = Point.new(x: 10, y: 0)
    distance = geometry.calculate_distance_between_two_points(p1, p2)
    expect(distance).to eq(20)
  end

  it 'calculate distance between 2 points' do
    p1 = Point.new(x: 0, y: 10)
    p2 = Point.new(x: 0, y: -5)
    distance = geometry.calculate_distance_between_two_points(p1, p2)
    expect(distance).to eq(15)
  end

  it 'calculate perimeter from square figure' do
    p1 = Point.new(x: 3, y: 3)
    p2 = Point.new(x: 3, y: -3)
    p3 = Point.new(x: -3, y: -3)
    p4 = Point.new(x: -3, y: 3)
    points = [p1, p2, p3, p4]
    perimeter = geometry.calculate_perimeter_from_points(points)
    expect(perimeter).to eq(24)
  end

  it 'all points are aligned' do
    p1 = Point.new(x: 2, y: 2)
    p2 = Point.new(x: -2, y: -2)
    p3 = Point.new(x: -4, y: -4)
    p4 = Point.new(x: 8, y: 8)
    points = [p1, p2, p3, p4]
    aligned = geometry.are_aligned?(points)
    expect(aligned).to eq(true)
  end

  it 'points are not aligned' do
    p1 = Point.new(x: 2, y: 2)
    p2 = Point.new(x: -2, y: -2)
    p3 = Point.new(x: -4, y: -4)
    p4 = Point.new(x: 8, y: 9)
    points = [p1, p2, p3, p4]
    aligned = geometry.are_aligned?(points)
    expect(aligned).to eq(false)
  end

  it 'point is inside the figure area' do
    p = Point.new(x: 0, y: 0)
    p1 = Point.new(x: 5, y: 5)
    p2 = Point.new(x: 8, y: -10)
    p3 = Point.new(x: -10, y: 5)
    points = [p1, p2, p3]
    aligned = geometry.point_in_the_figure?(points, p)
    expect(aligned).to eq(true)
  end

  it 'point is not inside in the figure' do
    p = Point.new(x: 0, y: 0)
    p1 = Point.new(x: 10, y: 15)
    p2 = Point.new(x: 4, y: 5)
    p3 = Point.new(x: 15, y: -2)
    points = [p1, p2, p3]
    aligned = geometry.point_in_the_figure?(points, p)
    expect(aligned).to eq(false)
  end
end
