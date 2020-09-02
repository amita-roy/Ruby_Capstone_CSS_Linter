require 'pp'

class LengthZeroNoUnit
  def self.format_children(children)
    children.select { |elem| elem[:node] == :property }
  end

  def self.retrieve_dimension(properties)
    tokens = []
    properties.each { |elem| tokens.concat(elem[:tokens]) }
    tokens.select { |elem| elem[:node] == :dimension }
  end

  def self.check(children)
    units = %w[px em rem PX EM REM vh vw VH VW]
    unit = ''
    has_unit = false
    properties = format_children(children)
    dimensions = retrieve_dimension(properties)
    dimensions.each do |dimension|
      if (dimension[:value]).zero? && units.include?(dimension[:unit])
        has_unit = true
        unit = dimension[:unit]
      end
    end

    return "Unit #{unit} used for value zero" if has_unit
  end
end
