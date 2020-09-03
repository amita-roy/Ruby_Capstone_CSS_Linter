require_relative 'utils'

module VerifyRules
  include Utils

  def duplicate_selector(tree, errors)
    tree.each do |node|
      if node[:node] == :style_rule
        errs = verify_selector_rules(node[:selector], tree)
        errors.concat(errs) unless errs.nil?
      end
    end
  end

  def selector_typcase(tree, errors)
    tree.each do |node|
      if node[:node] == :style_rule
        errs = verify_selector_typecase(node[:selector])
        errors.concat(errs) unless errs.nil?
      end
    end
  end

  def length_zero_unit(tree, errors)
    tree.each do |node|
      if node[:node] == :style_rule
        errs = verify_length_zero(node[:children])
        errors.concat(errs) unless errs.nil?
      end
    end
  end

  def valid_unit(tree, errors)
    tree.each do |node|
      if node[:node] == :style_rule
        errs = verify_valid_units(node[:children])
        errors.concat(errs) unless errs.nil?
      end
    end
  end
end
