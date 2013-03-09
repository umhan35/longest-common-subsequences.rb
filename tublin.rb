require './sequence.rb'

class Tublins
  
  def initialize
    @list = []
  end
  
  def << tublin
    @list << tublin
  end
  
  def distances
    height, width = @list.size-1, @list.size
    
    t = Array.new(height) { Array.new(width) }
    
    for i in 0...height
      for j in i.next...width
        t[i][j] = @list[i].editDistanceTo @list[j]
        yield i, j, t[i][j] if block_given?
      end
    end
    
    t
  end
  
  private :distances
  
  def print
    puts 'All Tublins'
    @list.each_with_index do |tublin, i|
      printf "%d %s\n", i, tublin.name
    end
    
    puts
    
    puts 'Edit Distances'
    closest, farthest = nil, nil
    distances do |i, j, distance|
      printf "%d-%d: %d\n", i, j, distance
      
      closest = [i, j, distance] if closest.nil? or distance < closest[2] 
      farthest= [i, j, distance] if farthest.nil? or distance > farthest[2] 
    end
    
    puts
    
    printf "Closest\n%d-%d: %d\n", closest[0], closest[1], closest[2]
    puts
    printf "Farthest\n%d-%d: %d\n", farthest[0], farthest[1], farthest[2]
    
  end
  
end

class Tublin
  include EditDistance
  
  attr_reader :name, :sequence
  
  def initialize name, sequence
    @name, @sequence = name, sequence
  end
  
  def editDistanceTo b
    editDistance @sequence, b.sequence
  end
  
  def to_s
    format '%s: %s', @name, @sequence
  end
end
