require 'pp'
require 'pry'

class NoDuplicateSelectorRule
  def self.format_tokens(tokens)
    tokens.select { |elem| elem[:node] == :ident }.map { |elem| elem[:value] }
  end

  def self.check(selector, tree)
    has_duplicates = false

    tokens = selector[:tokens]

    selectors = format_tokens(tokens)
    has_duplicates = selectors.length > selectors.uniq.length

    tree.each do |node|
      if node[:node] == :style_rule
        other_selector = format_tokens(node[:selector][:tokens])
        has_duplicates = true if selectors.sort == other_selector.sort
      end
    end
    return "Duplicate selectors in #{selector[:value].gsub("\n", '')}" if has_duplicates
  end
end
