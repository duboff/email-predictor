require_relative './lib/predictor'
require_relative './lib/encoder'
require_relative './lib/decoder'
require_relative './lib/analyser'
require_relative './lib/constants'

predictor = Predictor.new(AVAILABLE_PATTERNS)
predictor.seed(SEED)

puts "Available options for"
TO_PREDICT.each do |name,domain|
  puts "#{name} @ #{domain}"
  puts '...',  predictor.predict(name,domain)
  puts ''
end
