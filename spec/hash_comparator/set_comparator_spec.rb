RSpec.describe HashComparator::SetComparator do
  subject { described_class.calculate_overlap(subject_items: subject_items, target_items: target_items) }

  let(:subject_items) { ['tanner', 'john', 'susan', 'susan'] }
  let(:target_items) { ['stacey', 'susan', 'susan'] }

  it 'returns the set intersection' do
    expect(subject).to eq ['susan']
  end
end