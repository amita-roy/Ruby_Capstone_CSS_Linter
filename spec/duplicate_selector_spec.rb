require_relative '../rules/no_duplicate_selector.rb'

describe NoDuplicateSelectorRule do
  subject { described_class }
  let(:tokens) { [{ :node => :ident, :pos => 0, :raw => 'a', :value => 'a' }, { :node => :whitespace, :pos => 1, :raw => ' ' }, { :node => :ident, :pos => 2, :raw => 'd', :value => 'd' }] }
  let(:result) { ['a', 'd'] }
  context 'receives 2 class methods' do
    it 'has format_tokens class method' do
      allow(subject).to receive(:format_tokens).with([]).and_return([])
      #   subject::format_tokens([])
    end

    it 'has check class method' do
      allow(subject).to receive(:check).with({}, []).and_return('string')
      #   subject::format_tokens([])
    end
  end

  describe '#format_tokens' do
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
end
