RSpec.describe HashComparator::SetComparator do
  subject { described_class.calculate_overlap(subject_items: [], target_items: []) }

  it 'returns the thing' do
    expect(subject).to eq '100%'
  end
end