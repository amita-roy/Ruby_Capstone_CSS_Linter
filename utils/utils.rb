require_relative '../rules/no_duplicate_selector.rb'
require_relative '../rules/selector_typecase.rb'
require_relative '../rules/length_zero_no_unit.rb'
require_relative '../rules/valid_units.rb'
require 'pp'

module Utils
  def verify_selector_rules(selector, tree)
    errors = []
    selector_rules = [NoDuplicateSelectorRule]
    selector_rules.each do |rule|
      err = rule.check(selector, tree)
      errors.push(err) unless err.nil?
    end
    errors
  end

  def verify_selector_typecase(selector)
    errors = []
    selector_rules = [SelectorTypeCase]
    selector_rules.each do |rule|
      err = rule.check(selector)
      errors.push(err) unless err.nil?
    end
    errors
  end

  def verify_length_zero(children)
    errors = []
    rules = [LengthZeroNoUnit]
    rules.each do |rule|
      err = rule.check(children)
      errors.push(err) unless err.nil?
    end
    errors
  end

  def verify_valid_units(children)
    errors = []
    rules = [ValidUnits]
    rules.each do |rule|
      err = rule.check(children)
      errors.push(err) unless err.nil?
    end
    errors
  end
end
