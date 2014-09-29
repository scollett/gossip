ENV['RACK_ENV'] = 'test'
require 'rubygems'
require 'bundler'
$LOAD_PATH.unshift(File.absolute_path(File.join(File.dirname(__FILE__), '../')))
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
require "minitest/autorun"