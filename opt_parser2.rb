#!/usr/bin/env ruby

require 'optparse'
require 'date'

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
  
  opt.on("-e ENVIRONMENT","--envrionment ENVIRONMENT",Numeric,"which enviroment you want server run") do |envrionment|
    options[:envrionment] = envrionment
  end
  
  opt.on("-d","--deamon","runing on deamon mode?") do
    options[:deamon] = true
  end
  
  opt.on("--delay N", Float, "Delay N seconds before executing") do |n|
    options[:delay] = n
  end
  
  opt.on("-j x,y,z","--jurisdictions x,y,z", Array, "which jurisdiction will start") do |jurisdictions|
    options[:jurisdictions] = jurisdictions
  end
  
  server_list = %w[a b c]
  opt.on("-s SERVERS","--servers SERVERS", server_list, "which server will start between #{server_list.join(',')}") do |servers|
    options[:servers] = servers
  end
 
  opt.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  
  opt.on_tail("-h","--help","help") do 
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
