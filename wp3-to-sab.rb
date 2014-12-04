require 'rubygems'
require 'optparse'

$options = { :input => "input", :output => "output", :transition => false }

def verbose(message)
  $stderr.puts message if $options[:verbose]
end

def debug(message)
  $stderr.puts 'DEBUG: ' + message 
end

cmd_options = {}
OptionParser.new do |opts|
  opts.banner = 'Usage: wp3-to-sab.rb [options]'

  opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
    cmd_options[:verbose] = v
  end

  opts.on('-i', '--input DIRECTORY', 'Specify input directory which contains extracted files from .wp3 file') do |i|
    cmd_options[:input] = i
  end

  opts.on('-o', '--output DIRECTORY', 'Specify output directory for generated Scripture App Builder files') do |o|
    cmd_options[:output] = o
  end

  opts.on('-t', '--[no-]transition', 'Generate transitions') do |t|
    cmd_options[:transition] = t
  end
end.parse!

$options.merge!(cmd_options)

puts <<-eos
INPUT: #{$options[:input]}
OUTPUT: #{$options[:output]}
TRANSITION: #{$options[:transition]}
eos
