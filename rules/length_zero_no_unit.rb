require 'pp'

class LengthZeroNoUnit
  def self.format_children(children)
    children.select { |elem| elem[:node] == :property }
  end

  def self.retrieve_dimension(properties)
  end

  def self.check(children)
    properties = format_children(children)
    tokens = []
    properties.each { |elem| tokens.concat(elem[:tokens]) }
    PP.pp tokens.select { |elem| elem[:node] == :dimension }
  end
end
