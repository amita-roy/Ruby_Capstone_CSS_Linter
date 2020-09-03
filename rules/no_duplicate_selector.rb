require 'pp'

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
      if node[:node] == :style_rule # rubocop:disable Style/Next
        other_selector = node[:selector]
        tokens = format_tokens(other_selector[:tokens])
        has_duplicates = true if other_selector[:value] != selector[:value] && selectors.sort == tokens.sort
      end
    end
    return "Duplicate selectors in #{selector[:value].gsub("\n", '')}" if has_duplicates
  end
end
