require 'crass'

RSpec.shared_context 'shared_content' do
  def tree
    tree = []
    File.open('./css/test/tree.css') do |file|
      contents = file.read
      tree = Crass.parse(contents)
    end
    tree
  end

  def tree_with_no_duplicates
    tree = []
    File.open('./css/test/tree2.css') do |file|
      contents = file.read
      tree = Crass.parse(contents)
    end
    tree
  end

  def selector
    {
      node: :selector, value: "a d,\nb > c",
      tokens: [
        { node: :ident, raw: 'a', value: 'a' }, { node: :ident, raw: 'd', value: 'd' },
        { node: :ident, raw: 'b', value: 'b' }, { node: :delim, raw: '>', value: '>' },
        { node: :ident, raw: 'c', value: 'c' }
      ]
    }
  end

  def tokens
    [{ node: :ident, raw: 'a', value: 'a' }, { node: :ident, raw: 'd', value: 'd' }]
  end
end

RSpec.shared_context 'shared_typecase_content' do
  def selector
    {
      node: :selector, value: "a d,\nb > c",
      tokens: [
        { node: :ident, raw: 'a', value: 'a' }, { node: :ident, raw: 'd', value: 'd' },
        { node: :ident, raw: 'b', value: 'b' }, { node: :delim, raw: '>', value: '>' },
        { node: :ident, raw: 'c', value: 'c' }
      ]
    }
  end

  def tokens
    [{ node: :ident, raw: 'a', value: 'a' }, { node: :ident, raw: 'd', value: 'd' }]
  end

  def selector_typecase
    { node: :selector, value: '#IDP', tokens: [{ node: :hash, raw: '#IDP', type: :id, value: 'IDP' }] }
  end

  def selector_typecase2
    { node: :selector, value: '#idp', tokens: [{ node: :hash, raw: '#idp', type: :id, value: 'idp' }] }
  end

  def selectortypcase_tokens
    [{ node: :hash, raw: '#IDP', type: :id, value: 'IDP' }]
  end
end

RSpec.shared_context 'shared_content_Lengthnozerounit' do
  def children
    [{
      node: :property, name: 'top', value: '0px',
      children: [{ node: :dimension, pos: 11, raw: '0px', repr: '0', type: :integer, unit: 'px', value: 0 }],
      important: false,
      tokens: [{ node: :ident, raw: 'top', value: 'top' }, { node: :colon, raw: ':' },
               { node: :dimension, pos: 11, raw: '0px', repr: '0', type: :integer, unit: 'px', value: 0 }]
    },
     { node: :semicolon, pos: 14, raw: ';' }]
  end

  def properties
    [{
      node: :property, name: 'top', value: '0px',
      children: [{ node: :dimension, pos: 11, raw: '0px', repr: '0', type: :integer, unit: 'px', value: 0 }],
      important: false,
      tokens: [
        { node: :ident, raw: 'top', value: 'top' }, { node: :colon, raw: ':' },
        { node: :dimension, pos: 11, raw: '0px', repr: '0', type: :integer, unit: 'px', value: 0 }
      ]
    }]
  end

  def dimensions
    [{ node: :dimension, pos: 11, raw: '0px', repr: '0', type: :integer, unit: 'px', value: 0 }]
  end
end

RSpec.shared_context 'shared_content_validunits' do
  def children
    [{
      node: :property, name: 'height', value: '100pixel',
      children: [
        { node: :dimension, pos: 14, raw: '100pixel', repr: '100', type: :integer, unit: 'pixel', value: 100 }
      ],
      important: false,
      tokens: [
        { node: :ident, raw: 'height', value: 'height' }, { node: :colon, pos: 12, raw: ':' },
        { node: :dimension, pos: 14, raw: '100pixel', repr: '100', type: :integer, unit: 'pixel', value: 100 }
      ]
    }, { node: :semicolon, pos: 22, raw: ';' }]
  end

  def properties
    [{
      node: :property, name: 'height', value: '100pixel',
      children: [
        { node: :dimension, pos: 14, raw: '100pixel', repr: '100', type: :integer, unit: 'pixel', value: 100 }
      ],
      important: false,
      tokens: [
        { node: :ident, raw: 'height', value: 'height' }, { node: :colon, pos: 12, raw: ':' },
        { node: :dimension, pos: 14, raw: '100pixel', repr: '100', type: :integer, unit: 'pixel', value: 100 }
      ]
    }]
  end

  def dimensions
    [{ node: :dimension, pos: 14, raw: '100pixel', repr: '100', type: :integer, unit: 'pixel', value: 100 }]
  end
end
