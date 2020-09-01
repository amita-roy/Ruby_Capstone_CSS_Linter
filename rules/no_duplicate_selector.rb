require 'pp'

class NoDuplicateSelectorRule
  def self.format_tokens(tokens)
    tokens.select { |elem| elem[:node] == :ident }.map { |elem| elem[:value] }
  end
end
