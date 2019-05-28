#!/usr/bin/env ruby

require_relative '../lib/web_logs'
require_relative '../lib/printer'

logs = WebLogs.new
logs.create_sites_hash(ARGV[0])

puts ''
puts 'List of Websites by total visits:'
puts ''
logs.order_sites
logs.site_count
puts ''
puts 'List of Websites by unique visitors:'
puts ''
logs.order_ips
logs.ips_count
puts ''
