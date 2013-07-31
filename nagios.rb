#!/usr/bin/env ruby

require 'json'
require 'open-uri'

key = ENV['KEY'] # Dashsource

doc = open("http://dashsource.atech.io/source/nagios?key=#{key}").read
payload = JSON.parse(doc)

errors = []
payload['services']['issues'].sort_by{|i| i['status']}.each do |issue|
  errors << Array.new.tap do |a|
    issue_text = "\e[1m" + issue['status'].upcase + "\e[0m"
    case issue['status'].to_sym
    when :warning
      a << "\e[33m" + issue_text
    when :critical
      a << "\e[31m" + issue_text
    end
    
    a << issue['host']
    a << issue['service']
    a << "\n" + issue['info']
  end.join(' ')
end
if errors.count.zero?
  puts "No problems currently reported"
else
  puts errors.join("\n\n")
end


