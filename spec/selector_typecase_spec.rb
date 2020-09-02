require_relative '../rules/selector_typecase.rb'
require_relative 'shared_content'
require_relative 'shared_example'

describe SelectorTypeCase do
  subject { described_class }
  let(:result) { %w[a d] }

  it 'checks if subject is equal to SelectorTypeCase class' do
    expect(subject).to eq(SelectorTypeCase)
  end

  context 'has 2 methods' do
    it 'has format_tokens class method' do
      expect(subject).to receive(:format_tokens).with([]).and_return([])
      subject.format_tokens([])
    end

    it 'has check class method' do
      expect(subject).to receive(:check).with({}).and_return('')
      subject.check({})
    end
  end

  describe '#format_tokens' do
    include_context 'shared_typecase_content'
    context 'with valid input' do
      include_examples 'shared_example'
    end
  end

  describe '#check' do
    include_context 'shared_typecase_content'
    let(:error_string) { 'Selector type is uppercase in #IDP' }

    it 'raise a NameError error when called without class' do
      expect { format_tokens }.to(raise_error { NameError })
    end

    context 'with valid input' do
      it 'returns nil if no upprcase selector found' do
        expect(subject.check(selector_typecase2)).to be_nil
      end

      it 'returns error string when uppercase selector found' do
        expect(subject.check(selector_typecase)).to eq(error_string)
      end
    end
  end
end
