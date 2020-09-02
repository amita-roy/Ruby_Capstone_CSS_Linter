RSpec.shared_examples 'shared_example' do
  it 'return filtered array as per the condition given in block' do
    expect(subject.format_tokens(tokens)).to eq(result)
  end

  it 'return result is an instance of Array' do
    result = subject.format_tokens(tokens)
    expect(result).to be_instance_of(Array)
  end

  it 'raise a NameError error when called without class' do
    expect { format_tokens }.to(raise_error { NameError })
  end
end

RSpec.shared_examples 'shared_example2' do
  it 'returns properties as result' do
    expect(subject.format_children(children)).to eq(properties)
  end

  it 'checks whether the result is an instance of array' do
    expect(subject.format_children(children)).to be_instance_of(Array)
  end

  it 'returns dimensions as result' do
    expect(subject.retrieve_dimension(properties)).to eq(dimensions)
  end

  it 'checks whether the result is an instance of array' do
    expect(subject.retrieve_dimension(properties)).to be_instance_of(Array)
  end
end
