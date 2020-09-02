require 'pp'

class ValidUnits
  def self.format_children(children)
    children.select { |elem| elem[:node] == :property }
  end

  def self.retrieve_dimension(properties)
    tokens = []
    properties.each { |elem| tokens.concat(elem[:tokens]) }
    tokens.select { |elem| elem[:node] == :dimension }
  end

  def self.valid_units(unit)
    valid_unit = ''
    case unit
    when 'pixel'
      valid_unit = 'px'
    when 'percentage'
      valid_unit = '%'
    when 'viewportheight'
      valid_unit = 'vh'
    when 'viewportwidth'
      valid_unit = 'vw'
    else
      valid_unit = ''
    end
    return valid_unit
  end

  def self.check(children)
    units = %w[px em rem vh vw %]
    unit = ''
    value = ''
    valid_unit = ''
    invalid_unit = false
    properties = format_children(children)

    dimensions = retrieve_dimension(properties)
    dimensions.each do |dimension|
      if !units.include?(dimension[:unit])
        invalid_unit = true
        unit = dimension[:unit]
        value = dimension[:value]
      end
    end
    valid_unit = valid_units(unit)
    return "Invalid unit #{unit} used for value #{value}, instead use #{valid_unit}" if invalid_unit
  end
end
