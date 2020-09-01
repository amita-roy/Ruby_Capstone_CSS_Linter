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
end
