# frozen_string_literal: true

require 'net/https'
require 'yaml'
require 'json'

API_CONFIG = YAML.load_file('config/api.yml')

uri = URI.parse(API_CONFIG['url'])

# http get
http = Net::HTTP.new(uri.host)
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)

body = JSON.parse(response.body)

types = %w[Events Births Deaths]
type = types[Random.rand(types.size)]

puts "#{body['date']} - #{type}"
puts '=' * 10
body['data'][type].each { |event| puts "#{event['year']} - #{event['text']}" }
