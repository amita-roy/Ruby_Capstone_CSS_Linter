require_relative '../rules/valid_units.rb'
require_relative 'shared_content'
require_relative 'shared_example'

describe ValidUnits do
  subject { described_class }

  it 'checks if subject is equal to class ValidUnits' do
    expect(subject).to eq(ValidUnits)
  end

  context 'has 4 class methods' do
    it 'has format_children method with one argument' do
      expect(subject).to receive(:format_children).with([]).and_return([])
      subject.format_children([])
    end

    it 'has retrieve_dimension method with one argument' do
      expect(subject).to receive(:retrieve_dimension).with([]).and_return([])
      subject.retrieve_dimension([])
    end

    it 'has check method with one argument' do
      expect(subject).to receive(:check).with('').and_return('')
      subject.check('')
    end

    it 'has valid_units method with one argument' do
      expect(subject).to receive(:valid_units).with([]).and_return('')
      subject.valid_units([])
    end
  end

  describe '#format_children and #retrieve_dimension' do
    include_context 'shared_content_validunits'
    context 'with valid input' do
      include_examples 'shared_example2'
    end
  end

  describe '#valid_units' do
    it 'checks return value is an instance of string' do
      expect(subject.valid_units('pixel')).to be_instance_of(String)
    end
    it 'returns valid unit string' do
      expect(subject.valid_units('pixel')).to eq('px')
    end
  end

  describe '#check' do
    let(:units) { %w[px em rem vh vw %] }
    include_context 'shared_content_validunits'

    it 'checks if the return value is a string if error found' do
      expect(subject.check(children)).to be_instance_of(String)
    end

    it 'checks whether the unit is found in the array of units' do
      expect(units).to include(subject.valid_units('pixel'))
    end
  end
end
