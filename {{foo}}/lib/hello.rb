currencies = { US: "$", JP: "¥", UK: "£" }
country = %w(US JP UK).sample()

puts "Hello! The price is #{currencies[country]}100. 💸"
