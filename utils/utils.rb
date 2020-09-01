require_relative '../rules/no_duplicate_selector.rb'
require_relative '../rules/selector_typecase.rb'

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

  def verify_selector_typecase(selector, tree)
    errors = []
    selector_rules = [SelectorTypeCase]
    selector_rules.each do |rule|
      err = rule.check(selector, tree)
      errors.push(err) unless err.nil?
    end
    errors
  end
end
