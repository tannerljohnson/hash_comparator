RSpec.describe HashComparator::Hasher do
  subject { described_class.execute }

  it 'returns the thing' do
    expect(subject).to eq 'hey'
  end
end