#!/usr/bin/env ruby
require 'rubygems'
require 'optparse'
require 'nori'

path = File.dirname(File.expand_path($0))
require "#{path}/wp3_project.rb"


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

  opts.on('-i', '--input DIRECTORY', 'Specify input directory which contains extracted files from .wp3') do |i|
    cmd_options[:input] = i
  end

  opts.on('-o', '--output DIRECTORY', 'Specify output directory for generated SAB files') do |o|
    cmd_options[:output] = o
  end

  opts.on('-t', '--[no-]transition', 'Generate transitions') do |t|
    cmd_options[:transition] = t
  end
end.parse!

$options.merge!(cmd_options)

verbose <<-eos
----------
INPUT: #{$options[:input]}
OUTPUT: #{$options[:output]}
TRANSITION: #{$options[:transition]}
----------
eos

# Get the id and title from the input directory name.
# Windows (7zip) extracts the file to a directory the same as the filename w/o the ext
# Linux extracts the file to filename_FILES
# So for the file "002 Sin Enters the World.wp3",
#  Windows: 002 Sin Enters the World
#  Linux:   002 Sin Enters the World.wp3_FILES
input_full_dir = $options[:input]
input_dir = File.basename input_full_dir

project_id, project_title = input_dir.match(/^(\d+)\s+([^.]+)/).captures
verbose <<-eos
INPUT_DIR: #{input_dir}
ID: #{project_id}
TITLE: #{project_title}
----------
eos



project = MSPhotoStory.Project.new()
