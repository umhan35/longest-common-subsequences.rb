class String
  def each_char_with_index
    self.split('').each_with_index do |char, i|
      yield char, i
    end
  end
end

require 'logger'
$log = Logger.new STDOUT
$log.level = Logger::DEBUG
