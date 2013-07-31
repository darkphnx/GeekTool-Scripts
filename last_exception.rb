#!/usr/bin/env ruby

require 'json'
require 'open-uri'

application_token = ENV['KEY'] 

doc = open("http://exceptions.atechmedia.com/api/list?api_key=#{application_token}").read
payload = JSON.parse(doc)

payload.first(10).each do |e|
  line = Array.new.tap do |a|
    time = Time.parse(e["logged_exception"]["received_at"])
    a << "\e[1m" + time.localtime.strftime("%H:%M") + "\e[0m"
    a << '-'
    a << e["logged_exception"]["error_message"]
    a << "in"
    a << e["logged_exception"]["request"]["component"].to_s + '#' + e["logged_exception"]["request"]["action"].to_s    
  end.join(' ')

  puts line
end
