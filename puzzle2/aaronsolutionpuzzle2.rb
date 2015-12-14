raw = File.read("puzzle2/input.txt").split("\n") # returns array of boxes

def calculate_area_of_sides(dimensions)
  l, w, h = dimensions
  return [2*l*w, 2*w*h, 2*h*l]
end

def calculate_total(area_of_sides)
  area_of_sides.inject(:+) + (area_of_sides.min/2)
end

answer = raw. 
    map { |i| i.split('x') }. # converts boxes in array of dimensions [1,1,1]
    map { |i| i.map {|n| n.to_i }}. # coerce dimensions into integers
    map { |i| calculate_area_of_sides(i) }.
    map { |i| calculate_total(i) }.
    inject(:+)

puts answer