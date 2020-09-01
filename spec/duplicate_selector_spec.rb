require_relative '../rules/no_duplicate_selector.rb'
require_relative 'shared_content'

describe NoDuplicateSelectorRule do
  subject { described_class }

  let(:result) { ['a', 'd'] }
  context 'receives 2 class methods' do
    it 'has format_tokens class method' do
      allow(subject).to receive(:format_tokens).with([]).and_return([])
    end

    it 'has check class method' do
      allow(subject).to receive(:check).with({}, []).and_return('string')
    end
  end

  describe '#format_tokens' do
    include_context 'shared_content'
    context 'with valid input' do
      it 'return filtered array as per the condition given in block' do
        expect(subject::format_tokens(tokens)).to eq(result)
      end

      it 'return result is an instance of Array' do
        result = subject::format_tokens(tokens)
        expect(result).to be_instance_of(Array)
      end
    end

    it 'raise a NameError error when called without class' do
      expect { format_tokens }.to raise_error { NameError }
    end
  end

  describe '#check' do
    include_context 'shared_content'
    let(:error_string) { 'Duplicate selectors in a d,b > c' }

    it 'raise a NameError error when called without class' do
      expect { format_tokens }.to raise_error { NameError }
    end

    context 'with valid input' do
      it 'returns nil if no duplicate found' do
        expect(subject::check(selector, tree_with_no_duplicates)).to be_nil
      end

      it 'returns error string when duplicate selector found' do
        expect(subject::check(selector, tree)).to eq(error_string)
      end
    end
  end
end
