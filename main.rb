require 'Crass'
require_relative './utils/verify_rules'

class Main
  include VerifyRules

  def run()
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
      puts ''
      puts err
      puts '-' * 50
    end
  end
end

Main.new.run
