require 'Crass'
require_relative './utils/verify_rules.rb'
require 'pp'

def run()
  include Utils

  path = ARGV.first
  errors = []
  File.open(path) do |file|
    contents = file.read
    tree = Crass.parse(contents)

    duplicate_selector(tree, errors)
    selector_typcase(tree, errors)
    length_zero_unit(tree, errors)
    valid_unit(tree, errors)
  end
  errors.each do |err|
    puts err
  end
end

run
