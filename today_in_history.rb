require 'net/https'
require 'yaml'

API_CONFIG = YAML.load_file("config/api.yml")

uri = URI.parse(API_CONFIG["url"])

# http get
http = Net::HTTP.new(uri.host)
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)

body = eval response.body

puts body[:date]
puts "=" * 10
body[:data][:Events].each do |event| puts "#{event[:year]} - #{event[:text]}" end