class SelectorTypeCase
  def self.format_tokens(tokens)
    tokens.select { |elem| elem[:node] == :ident || elem[:node] == :hash }.map { |elem| elem[:value] }
  end

  def self.check(selector, tree)
    has_uppercase = false
    tokens = selector[:tokens]
    p tokens
    selectors = format_tokens(tokens)
    p selectors
    selectors.each do |item|
      p item
      has_uppercase = true if item =~ /[A-Z]/
    end

    return "Selector type is uppercase in #{selector[:value]}" if has_uppercase
  end
end
