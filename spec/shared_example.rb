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
