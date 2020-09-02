require_relative '../rules/length_zero_no_unit.rb'
require_relative 'shared_content'
require_relative 'shared_example'

describe LengthZeroNoUnit do
  subject { described_class }

  it 'checks if the subject is equal to LengthZeroNoUnit' do
    expect(subject).to eq(LengthZeroNoUnit)
  end

  context 'has 3 class methods' do
    it 'has format_children method' do
      expect(subject).to receive(:format_children).with([]).and_return([])
      subject.format_children([])
    end

    it 'has retrieve_dimension method' do
      expect(subject).to receive(:retrieve_dimension).with([]).and_return([])
      subject.retrieve_dimension([])
    end

    it 'has check method' do
      expect(subject).to receive(:check).with([]).and_return([])
      subject.check([])
    end
  end

  describe '#format_children' do
    include_context 'shared_content_Lengthnozerounit'
    context 'with valid inputs' do
      include_examples 'shared_example2'
    end
  end

  describe '#retrieve_dimension' do
    include_context 'shared_content_Lengthnozerounit'
    context 'with valid inputs' do
      include_examples 'shared_example2'
    end
  end

  describe '#check' do
    include_context 'shared_content_Lengthnozerounit'
    context 'with valid input' do
      it 'return error string if any unit found with 0 value' do
        expect(subject.check(children)).to eq('Unit px used for value zero')
      end
    end
  end
end
