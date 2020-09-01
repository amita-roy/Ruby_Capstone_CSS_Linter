require_relative '../rules/no_duplicate_selector.rb'
require_relative 'shared_content'
require_relative 'shared_example'

describe NoDuplicateSelectorRule do
  subject { described_class }

  let(:result) { %w[a d] }
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
      include_examples 'shared_example'
    end
  end

  describe '#check' do
    include_context 'shared_content'
    let(:error_string) { 'Duplicate selectors in a d,b > c' }

    it 'raise a NameError error when called without class' do
      expect { format_tokens }.to(raise_error { NameError })
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
