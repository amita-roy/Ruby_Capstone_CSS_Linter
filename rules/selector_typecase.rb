class SelectorTypeCase
  def self.format_tokens(tokens)
    tokens.select { |elem| elem[:node] == :ident }.map { |elem| elem[:value] }
  end

  def self.check(selector, tree)
    has_uppercase = false
    tokens = selector[:tokens]
    selectors = format_tokens(tokens)

    selectors.each do |item|
      has_uppercase = true if item =~ /[A-Z]/
    end

    return "Selector type is uppercase in #{selector[:value]}" if has_uppercase
  end
end
