require "http"

while true
  system "clear"
  puts "Welcome to the dictionary!"
  puts "Enter a word:"
  word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
  puts "Definition:"
  p response.parse[0]["text"]

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
  puts "Pronunciation:"
  p response.parse[0]["raw"]

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/topExample?useCanonical=false&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
  puts "Top Example:"
  p response.parse["text"]

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
  puts "File Url:"
  # p response.parse[0]["fileUrl"]
  system("open", "#{response.parse[0]['fileUrl']}")

  puts "Enter q to quit or any other key to continue"
  if gets.chomp == "q"
    puts "Thank you, goodbye!"
    break
  end

end