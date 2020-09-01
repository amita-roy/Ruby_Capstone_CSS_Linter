require 'Crass'
require_relative './utils/utils.rb'
require 'pp'

def run()
  include Utils

  path = ARGV.first
  errors = []
  File.open(path) do |file|
    contents = file.read
    tree = Crass.parse(contents)

    tree.each do |node|
      if node[:node] == :style_rule
        errs = verify_selector_rules(node[:selector], tree)
        errors.concat(errs) unless errs.nil?
      end
    end

    tree.each do |node|
      if node[:node] == :style_rule
        errs = verify_selector_typecase(node[:selector])
        errors.concat(errs) unless errs.nil?
      end
    end

    tree.each do |node|
      if node[:node] == :style_rule
        errs = verify_length_zero(node[:children])
        errors.concat(errs) unless errs.nil?
      end
    end
  end
  errors.each do |err|
    puts err
  end
end

run
