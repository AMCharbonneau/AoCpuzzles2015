data = File.read("input.txt")

#Puzzle 3 Part One
#A point in the xy-plane is represented by two numbers, (x, y)
#where x and y are the coordinates of the x- and y-axes.

# Santa is delivering presents to an infinite two-dimensional grid of houses.

# He begins by delivering a present to the house at his starting location
####Starting locaton will be represented by [0,0]

# An elf at the North Pole calls him via radio and tells him where to move next.
# Moves are always exactly one house to the 
# north (^), represented by [x, y + 1]
# south (v), represented by [x, y - 1]
# east (>), represented by [x + 1, y]
# west (<). represented by [x -1, y]
# After each move, he delivers another present to the house at his new location.


# > delivers presents to 2 houses: one at the starting location, and one to the east.
# ^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
# ^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.


def findcoordinates(input)
  case input
  when "^"
    position = [0,1]
  when "v"
    position = [0,-1]
  when ">"
    position = [1,0]
  when "<"
    position = [-1,0]
  end
end

#Puzzle Part 1 Solution
dataArray = data.split("")

coordinatesArray = [[0,0]]

dataArray.each do |i|
  eachcoordinate = findcoordinates(i)

  newcoordinates = [eachcoordinate, coordinatesArray.last].transpose.map {|a| a.inject(:+)}
  coordinatesArray.push(newcoordinates)
end

puts coordinatesArray.size
puts coordinatesArray.uniq.size

#Puzzle 3 Part 2 Solution

# Solution in words
# Slice the initial data 
# Recombine into two arrays
# Run my first solution for each array 
# Combine the resulting arrays.uniq.size


#TESTING MY METHODS for splitting and recombining arrays
# test = "abababab"
# testarray = test.split("")
# evenarray = testarray.values_at(* testarray.each_index.select {|i| i.even?})
# puts evenarray
# puts "and now"
# oddarray = testarray.values_at(* testarray.each_index.select {|i| i.odd?})
# puts oddarray
# puts "now recombined"
# recombined = evenarray += oddarray
# puts recombined

#dataArray = data.split("")

santaVisits = dataArray.values_at(* dataArray.each_index.select {|i| i.even?})
robotVisits = dataArray.values_at(* dataArray.each_index.select {|i| i.odd?})

santaCoordinatesArray = [[0,0]]
robotCoordinatesArray = [[0,0]]

santaVisits.each do |i|
  eachcoordinate = findcoordinates(i)

  newcoordinates = [eachcoordinate, santaCoordinatesArray.last].transpose.map {|a| a.inject(:+)}
  santaCoordinatesArray.push(newcoordinates)
end

robotVisits.each do |i|
  eachcoordinate = findcoordinates(i)

  newcoordinates = [eachcoordinate, robotCoordinatesArray.last].transpose.map {|a| a.inject(:+)}
  robotCoordinatesArray.push(newcoordinates)
end

everyonesVisits = santaCoordinatesArray += robotCoordinatesArray

puts everyonesVisits.size
puts everyonesVisits.uniq.size





