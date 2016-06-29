#Game of Life

def NeighborChecker(some_grid)
  #some_grid = Marshal.load(Marshal.dump(grid))
  grid = Array.new(20){Array.new(20){false}}
  (0..19).each do |i|
    (0..19).each do |j|
      neighbors=0
      if IsValid(i-1,j-1) && some_grid[i-1][j-1]==true
        neighbors=neighbors+1
      end
      if IsValid(i+1,j+1) && some_grid[i+1][j+1]==true
        neighbors=neighbors+1
      end
      if IsValid(i-1,j+1) && some_grid[i-1][j+1]==true
        neighbors=neighbors+1
      end
      if IsValid(i+1,j-1) && some_grid[i+1][j-1]==true
        neighbors=neighbors+1
      end
      if IsValid(i,j-1) && some_grid[i][j-1]==true
        neighbors=neighbors+1
      end
      if IsValid(i,j+1) && some_grid[i][j+1]==true
        neighbors=neighbors+1
      end
      if IsValid(i+1,j) && some_grid[i+1][j]==true
        neighbors=neighbors+1
      end
      if IsValid(i-1,j) && some_grid[i-1][j]==true
        neighbors=neighbors+1
      end
      if some_grid[i][j]
        grid[i][j]=Rules(neighbors)
      elsif neighbors==3
        grid[i][j]=true
      end
    end
  end
  grid
end
def Rules(neigbor_value)
  if neigbor_value<2||neigbor_value>3
    false
  else
    true
  end
end
def IsValid(x,y)
  if x >= 0 && x <20 && y >= 0 && y <20
    true
  else
    false
  end
end
def PrintGrid(some_grid)
  (0..19).each do |i|
    (0..19).each do |j|
      if some_grid[i][j]
        print "\u{25A1}"
      else
        print " "
      end
    end
    puts
  end
end

file_grid=Array.new(20){Array.new(20){false}}
i = 0
File.foreach( 'Pulsar.txt' ) do |f|
    j = 0
    f.each_char do |c|
        if c=="1"
            file_grid[i][j] = true
        else
            file_grid[i][j] = false
        end
        j = j + 1
    end
    i=i+1
end
PrintGrid(file_grid)
#new_grid=NeighborChecker(base_grid)
while true
  file_grid=NeighborChecker(file_grid)
  #base_grid=Marshal.load(Marshal.dump(new_grid))
  PrintGrid(file_grid)
  sleep(1)
end


base_grid=Array.new(20){Array.new(20){false}}
new_grid=Array.new(20){Array.new(20){false}}
temp_grid=Array.new(20){Array.new(20){false}}

# (0..100).each do |i|
# base_grid[rand(0..19)][rand(0..19)]=true
# end
#
# PrintGrid(base_grid)
# #new_grid=NeighborChecker(base_grid)
# while true
#   base_grid=NeighborChecker(base_grid)
#   #base_grid=Marshal.load(Marshal.dump(new_grid))
#   PrintGrid(base_grid)
#   sleep 1
# end
