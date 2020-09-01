require_relative '../rules/no_duplicate_selector.rb'

describe NoDuplicateSelectorRule do
  subject { described_class }
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
end
