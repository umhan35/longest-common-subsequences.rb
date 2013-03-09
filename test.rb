require 'test/unit'

require './prepare.rb'

class Q3Test < Test::Unit::TestCase

  require './sequence.rb'
  
  include LCS

  def testCLS
     assert_equal('BCBA', lcs('ABCBDAB', 'BDCABA')) # textbook
     assert_equal('TAAG', lcs('TATAGC', 'TAGCAG')) # on slides
     assert_equal('BCBA', lcs('ABCBDAB', 'BDCABA')) # textbook
     assert_equal('BCD', lcs('ABCD', 'XBCYDQ')) # on a3
  end
  
  include EditDistance
  
  def testCLS
     assert_equal(5, editDistance('ABCBDAB', 'BDCABA')) # textbook
     assert_equal(4, editDistance('TATAGC', 'TAGCAG')) # on slides
     assert_equal(5, editDistance('ABCBDAB', 'BDCABA')) # textbook
     assert_equal(4, editDistance('ABCD', 'XBCYDQ')) # on a3
  end
end


class TublinsTest < Test::Unit::TestCase

  require './tublin.rb'

  def setupTublinsDistanceTable
    file = <<HERE
Drosophila melanogaster: mrecisvhigqagvqignacwelyclehgiqpdghmpsdktvgggddsfstffsetgagkhvpravfvdleptvvdevrtgtyrqlfhpeqlitgkedaannyarghytigkeivdvvldrirkladqctglqgflvfhsfgggtgsgftsllmerlsvdygkksklefsiypapqvstavvepynsiltthttlehsdcafmvdneaiydicrrnldierptymnlnrligqivssitaslrfdgalnvdltefqtnlvpyprihfplatyapvisvekayheqltvaeitnacfepanqmvkcdprrgkymaccmlyrgdvvpkdvnaaiatiktkrsiqfvdwcptgfkvginyqpptvvpggdlakvqravcmlsnttaiaeawarldhkfdlmyakrafvhwyvgegmeegefaearedlaalekdyeevgidsttelgedeey
Schistosoma mansoni: mrecislhigqagvqmgnacwelyclehgiqpnghmatnetkekidgafntfftemtsgkhvpraifvdlepnvvdevrcgtykqlfhpeqlitgkedaannyarghytvgkeiidlvlervrksadqcsglqgflifhsfgggtgsgftsllmerlsveygkrsklefaiypapqiataivepynsiltthttlehsdcafmvdneaiydicrknlgighptytnlnrliaqivssitaslrfdgalnvdltefqtnlvpyprihfplatyapiisaekafheqlsvaeitnscfetgnqmvkcdprtgkymaccllyrgdvvpkdvnaaianiktkktiqfvdwcptgfkvginyqpptavpggdlakvqravcmlsnttaiaeawarldrkfdlmyakrafvhwyvgegmeegeftearedtaalekdyaevgcdtimldeddeeqef
Zea mays: mreiisihigqagiqvgnacwelyclehgiehdgtmpsdssvgvahdafntffsetgsgkhvpraifvdleptvidevrtgsyrqlfhpeqlisgkedaannfarghytvgkeivdlcldrvrkladnctglqgflvfnavgggtgsglgslllerlsvdygkksklgftiypspqvstavvepynsvlsthsllehtdvavlldneaiydicrrsldierptytnlnrlisqiisslttslrfdgainvdvtefqtnlvpyprihfmlssyapvisaekayheqlsvpeitnavfepssmmakcdprhgkymacclmyrgdvvpkdvnaavatiktkrtvqfvdwcptgfkcginyqppsvvpggdlakvqravcmisnntavaevfsridhkfdlmyakrafvhwyvgegmeegefsearedlaalekdyeevgaegaddegdegddy
Rattus norvegicus: mrecisihvgqagvqignacwelyclehgiqpdgqmpsdktigggddsfntffsetgagkhvpravfvdleptvidevrtgtyrqlfhpeqlitgkedaannyarghytigkeiidlvldrirkladqctglqgflvfhsfgggtgsgftsllmerlsvdygkksklefsiypapqvstavvepynsiltthttlehsdcafmvdneaiydicrrnldierptytnlnrligqivssitaslrfdgalnvdltefqtnlvpyprihfplatyapvisaekayheqlsvaeitnacfepanqmvkcdprhgkymaccllyrgdvvpkdvnaaiatiktkrtiqfvdwcptgfkvginyqpptvvpggdlakvqravcmlsnttaiaeawarldhkfdlmyakrafvhwyvgegmeegefsearedmaalekdyeevgvdsvegegeeegeey
Homo sapiens: mrecisihvgqagvqignacwelyclehgiqpdgqmpsdktigggddsfntffsetgagkhvpravfvdleptvidevrtgtyrqlfhpeqlitgkedaannyarghytigkeiidlvldrirkladqctrlqgflvfhsfgggtgsgftsllmerlsvdygkksklefsiypapqvstavvepynsiltthttlehsdcafmvdneaiydicrrnldierptytnlnrlisqivssitaslrfdgalnvdltefqtnlvpyprihfplatyapvisaekayheqlsvaditnacfepanqmvkcdpghgkymaccllyrgdvvpkdvnaaiatiktkrtiqfvdwcptgfkvginyqpptvvpggdlakvqravcmlsnttaiaeawarldhkfdlmyakrafvhwyvgegmeegefsearedmaalekdyeevgvdsvegegeeegeey
HERE
    
    tublins = Tublins.new
    file.each_line do |line|
      a = line.strip.split(': ')
      tublins.add Tublin.new(a[0], a[1])
    end
    
    @t = tublins._distanceTable
  end
  
  def testIncludedModules
    assert Tublins.include?(LCS)
    assert Tublins.include?(EditDistance)
  end
  
  def testTublins
    setupTublinsDistanceTable
    
    t = @t
    
    assert_equal Array, t.class
    
    assert_equal 4, t.size
    assert_equal 5, t[0].size
    
    count = 0
    for i in 0...4
      for j in i.next...5
        if i >= j
          assert t[i][j].nil?
        else
          assert ! t[i][j].nil?
          count += 1
        end
      end
    end
    
    assert_equal 10, count
  end
end
