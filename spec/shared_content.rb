RSpec.shared_context 'shared_content' do
  def tree
    [{ node: :style_rule,
      selector: { node: :selector, value: "a d,\nb > c",
                 tokens: [{ node: :ident, pos: 0, raw: 'a', value: 'a' },
                          { node: :whitespace, pos: 1, raw: ' ' },
                          { node: :ident, pos: 2, raw: 'd', value: 'd' },
                          { node: :comma, pos: 3, raw: ',' }, { node: :whitespace, pos: 4, raw: "\n" },
                          { node: :ident, pos: 5, raw: 'b', value: 'b' },
                          { node: :whitespace, pos: 6, raw: ' ' },
                          { node: :delim, pos: 7, raw: '>', value: '>' },
                          { node: :whitespace, pos: 8, raw: ' ' },
                          { node: :ident, pos: 9, raw: 'c', value: 'c' },
                          { node: :whitespace, pos: 10, raw: ' ' }] },
      children: [{ node: :whitespace, pos: 12, raw: "\n  " },
                 { node: :property, name: 'color', value: 'blue',
                  children: [{ node: :whitespace, pos: 21, raw: ' ' },
                             { node: :ident, pos: 22, raw: 'blue', value: 'blue' }],
                  important: false,
                  tokens: [{ node: :ident, pos: 15, raw: 'color', value: 'color' },
                           { node: :colon, pos: 20, raw: ':' },
                           { node: :whitespace, pos: 21, raw: ' ' },
                           { node: :ident, pos: 22, raw: 'blue', value: 'blue' }] },
                 { node: :semicolon, pos: 26, raw: ';' },
                 { node: :whitespace, pos: 27, raw: "\n" }] },
     { node: :whitespace, pos: 29, raw: "\n" },
     { node: :style_rule,
       selector: { node: :selector, value: "b > c,\na d",
                  tokens: [{ node: :ident, pos: 30, raw: 'b', value: 'b' },
                           { node: :whitespace, pos: 31, raw: ' ' },
                           { node: :delim, pos: 32, raw: '>', value: '>' },
                           { node: :whitespace, pos: 33, raw: ' ' }, { node: :ident, pos: 34, raw: 'c', value: 'c' },
                           { node: :comma, pos: 35, raw: ',' }, { node: :whitespace, pos: 36, raw: "\n" },
                           { node: :ident, pos: 37, raw: 'a', value: 'a' },
                           { node: :whitespace, pos: 38, raw: ' ' }, { node: :ident, pos: 39, raw: 'd', value: 'd' },
                           { node: :whitespace, pos: 40, raw: ' ' }] },
       children: [{ node: :whitespace, pos: 42, raw: "\n  " }, { node: :property, name: 'color', value: 'red', children: [{ node: :whitespace, pos: 51, raw: ' ' }, { node: :ident, pos: 52, raw: 'red', value: 'red' }], important: false, tokens: [{ node: :ident, pos: 45, raw: 'color', value: 'color' }, { node: :colon, pos: 50, raw: ':' }, { node: :whitespace, pos: 51, raw: ' ' }, { node: :ident, pos: 52, raw: 'red', value: 'red' }] }, { node: :semicolon, pos: 55, raw: ';' }, { node: :whitespace, pos: 56, raw: "\n" }] }, { node: :whitespace, pos: 58, raw: "\n" }]
  end

  def tree_with_no_duplicates
    [{ node: :style_rule, selector: { node: :selector, value: "a d,\nb > c", tokens: [{ node: :ident, pos: 0, raw: 'a', value: 'a' }, { node: :whitespace, pos: 1, raw: ' ' }, { node: :ident, pos: 2, raw: 'd', value: 'd' }, { node: :comma, pos: 3, raw: ',' }, { node: :whitespace, pos: 4, raw: "\n" }, { node: :ident, pos: 5, raw: 'b', value: 'b' }, { node: :whitespace, pos: 6, raw: ' ' }, { node: :delim, pos: 7, raw: '>', value: '>' }, { node: :whitespace, pos: 8, raw: ' ' }, { node: :ident, pos: 9, raw: 'c', value: 'c' }, { node: :whitespace, pos: 10, raw: ' ' }] }, children: [{ node: :whitespace, pos: 12, raw: "\n  " }, { node: :property, name: 'color', value: 'blue', children: [{ node: :whitespace, pos: 21, raw: ' ' }, { node: :ident, pos: 22, raw: 'blue', value: 'blue' }], important: false, tokens: [{ node: :ident, pos: 15, raw: 'color', value: 'color' }, { node: :colon, pos: 20, raw: ':' }, { node: :whitespace, pos: 21, raw: ' ' }, { node: :ident, pos: 22, raw: 'blue', value: 'blue' }] }, { node: :semicolon, pos: 26, raw: ';' }, { node: :whitespace, pos: 27, raw: "\n" }] }, { node: :whitespace, pos: 29, raw: "\n" }]
  end

  def selector
    { node: :selector, value: "a d,\nb > c", tokens: [{ node: :ident, pos: 0, raw: 'a', value: 'a' }, { node: :whitespace, pos: 1, raw: ' ' }, { node: :ident, pos: 2, raw: 'd', value: 'd' }, { node: :comma, pos: 3, raw: ',' }, { node: :whitespace, pos: 4, raw: "\n" }, { node: :ident, pos: 5, raw: 'b', value: 'b' }, { node: :whitespace, pos: 6, raw: ' ' }, { node: :delim, pos: 7, raw: '>', value: '>' }, { node: :whitespace, pos: 8, raw: ' ' }, { node: :ident, pos: 9, raw: 'c', value: 'c' }, { node: :whitespace, pos: 10, raw: ' ' }] }
  end

  def selector_typecase
    { node: :selector, value: '#IDP', tokens: [{ node: :hash, pos: 0, raw: '#IDP', type: :id, value: 'IDP' }, { node: :whitespace, pos: 4, raw: ' ' }] }
  end

  def selector_typecase2
    { node: :selector, value: '#idp', tokens: [{ node: :hash, pos: 0, raw: '#idp', type: :id, value: 'idp' }, { node: :whitespace, pos: 4, raw: ' ' }] }
  end

  def tokens
    [{ node: :ident, pos: 0, raw: 'a', value: 'a' }, { node: :whitespace, pos: 1, raw: ' ' }, { node: :ident, pos: 2, raw: 'd', value: 'd' }]
  end

  def selectortypcase_tokens
    [{ node: :hash, pos: 0, raw: '#IDP', type: :id, value: 'IDP' }, { node: :whitespace, pos: 4, raw: ' ' }]
  end
end

RSpec.shared_context 'shared_content_Lengthnozerounit' do
  def children
    [
      { node: :property,
       name: 'top',
       value: '0px',

       children: [{ node: :whitespace, pos: 10, raw: ' ' },
                  { node: :dimension,
                    pos: 11,
                    raw: '0px',
                    repr: '0',
                    type: :integer,
                    unit: 'px',
                    value: 0 }],

       important: false,

       tokens: [{ node: :ident, pos: 6, raw: 'top', value: 'top' },
                { node: :colon, pos: 9, raw: ':' },
                { node: :whitespace, pos: 10, raw: ' ' },
                { node: :dimension,
                  pos: 11,
                  raw: '0px',
                  repr: '0',
                  type: :integer,
                  unit: 'px',
                  value: 0 }] },
      { node: :semicolon, pos: 14, raw: ';' },
      { node: :whitespace, pos: 15, raw: "\n" }
    ]
  end

  def properties
    [{ node: :property,
      name: 'top',
      value: '0px',
      children: [{ node: :whitespace, pos: 10, raw: ' ' },
                 { node: :dimension,
                   pos: 11,
                   raw: '0px',
                   repr: '0',
                   type: :integer,
                   unit: 'px',
                   value: 0 }],
      important: false,
      tokens: [{ node: :ident, pos: 6, raw: 'top', value: 'top' },
               { node: :colon, pos: 9, raw: ':' },
               { node: :whitespace, pos: 10, raw: ' ' },
               { node: :dimension,
                 pos: 11,
                 raw: '0px',
                 repr: '0',
                 type: :integer,
                 unit: 'px',
                 value: 0 }] }]
  end

  def dimensions
    [{ node: :dimension,
       pos: 11,
       raw: '0px',
       repr: '0',
       type: :integer,
       unit: 'px',
       value: 0 }]
  end
end

RSpec.shared_context 'shared_content_validunits' do
  def children
    [{ node: :whitespace, pos: 3, raw: "\n" + '  ' },
     { node: :property,
      name: 'height',
      value: '100pixel',
      children: [{ node: :whitespace, pos: 13, raw: ' ' },
                 { node: :dimension,
                   pos: 14,
                   raw: '100pixel',
                   repr: '100',
                   type: :integer,
                   unit: 'pixel',
                   value: 100 }],
      important: false,
      tokens: [{ node: :ident, pos: 6, raw: 'height', value: 'height' },
               { node: :colon, pos: 12, raw: ':' },
               { node: :whitespace, pos: 13, raw: ' ' },
               { node: :dimension,
                 pos: 14,
                 raw: '100pixel',
                 repr: '100',
                 type: :integer,
                 unit: 'pixel',
                 value: 100 }] },
     { node: :semicolon, pos: 22, raw: ';' },
     { node: :whitespace, pos: 23, raw: "\n" }]
  end

  def properties
    [{ node: :property,
      name: 'height',
      value: '100pixel',
      children: [{ node: :whitespace, pos: 13, raw: ' ' },
                 { node: :dimension,
                   pos: 14,
                   raw: '100pixel',
                   repr: '100',
                   type: :integer,
                   unit: 'pixel',
                   value: 100 }],
      important: false,
      tokens: [{ node: :ident, pos: 6, raw: 'height', value: 'height' },
               { node: :colon, pos: 12, raw: ':' },
               { node: :whitespace, pos: 13, raw: ' ' },
               { node: :dimension,
                 pos: 14,
                 raw: '100pixel',
                 repr: '100',
                 type: :integer,
                 unit: 'pixel',
                 value: 100 }] }]
  end

  def dimensions
    [{ node: :dimension,
       pos: 14,
       raw: '100pixel',
       repr: '100',
       type: :integer,
       unit: 'pixel',
       value: 100 }]
  end
end
