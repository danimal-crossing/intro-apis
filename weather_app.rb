require "http"

system "clear"
puts "Welcome to the Weather app!"
puts "Enter a city:"
city = gets.chomp

response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial&APPID=APIKEYGOESHERE")

# .parse method gets the body section of the response
temperature = response.parse["main"]["temp"]
description = response.parse["weather"][0]["description"]

puts "Today in #{city} it is #{temperature} deegrees outside with #{description}."