#!/usr/bin/env ruby

def parse_options
  options = {}
  case ARGV[1]
  when "-e"
    options[:e] = ARGV[2]
  when "-d"
    options[:d] = ARGV[2]
  end
  options
end

case ARGV[0]
when "start"
  STDOUT.puts "start on #{parse_options.inspect}"
when "stop"
  STDOUT.puts "stop on #{parse_options.inspect}"
when "restart"
  STDOUT.puts "restart on #{parse_options.inspect}"
else 
  STDOUT.puts <<-EOF
Please provide command name

Usage: 
  tradition start
  tradition stop
  tradition restart
  
  options: 
    -e ENVIRONMENT. Default: development
    -d DEAMON, true or false. Default: true
EOF
end
  
