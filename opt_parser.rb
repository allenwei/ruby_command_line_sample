#!/usr/bin/env ruby

require 'optparse'

options = {}

opt_parser = OptionParser.new do |opt|
  opt.banner = "Usage: opt_parser COMMAND [OPTIONS]"
  opt.separator  ""
  opt.separator  "Commands"
  opt.separator  "     start: start server"
  opt.separator  "     stop: stop server"
  opt.separator  "     restart: restart server"
  opt.separator  ""
  opt.separator  "Options"
  
  opt.on("-e","--envrionment ENVRIONMENT","which enviroment you want server run") do |envrionment|
    options[:envrionment] = envrionment
  end
  
  opt.on("-d","--deamon","runing on deamon mode?") do
    options[:deamon] = true
  end
  
  opt.on("-h","--help","help") do 
    puts opt_parser
  end
end

opt_parser.parse!

case ARGV[0]
when "start" 
  puts "call start on options #{options.inspect}"
when "stop"
  puts "call stop on options #{options.inspect}"
when "restart"
  puts "call restart on options #{options.inspect}"
else 
  puts opt_parser
end
