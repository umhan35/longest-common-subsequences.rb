module LCS

  private

  # @params s1 vetical; s1 horozontal
  # @return lengthTable, height, width
  def lcsLengthTable s1, s2
    height, width = s1.size, s2.size
    
    # 0th col and row are used for index convenience
    t = Array.new(height+1) { Array.new(width+1) { 0 } }
    
    s1.each_char_with_index do |c1, i|
      i = i.next
      s2.each_char_with_index do |c2, j|
        j = j.next
        
        if c1 == c2
          t[i][j] = t[i-1][j-1] + 1
        elsif t[i-1][j] >= t[i][j-1]
          t[i][j] = t[i-1][j]
        else
          t[i][j] = t[i][j-1]
        end
      end
    end
    
    t
  end
  
  def lcs s1, s2
    lcs = ''
    
    l = lcsLengthTable s1, s2 # l means length
    height, width = l.size, l[0].size
    
    i, j = height - 1, width - 1
    until i == 0 or j == 0 
      c1, c2 = s1[i-1], s2[j-1]
      
      if c1 == c2 and l[i][j] == l[i-1][j-1] + 1
        lcs << c1
        i -= 1 and j -= 1
      elsif l[i][j] == l[i-1][j]
        i -= 1
      elsif l[i][j] == l[i][j-1]
        j -= 1
      end
    end
    
    lcs.reverse!
  end
end

module EditDistance
  include LCS
  
  private
  
  def editDistance s1, s2
    s1.size + s2.size - 2 * lcs(s1,s2).size
  end
end

