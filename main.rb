require './prepare.rb'

require './tublin.rb'

tublins = Tublins.new
open('tubulin.txt').each_line do |line|
  a = line.strip.split(': ')
  tublins << Tublin.new(a[0], a[1])
end

tublins.print
