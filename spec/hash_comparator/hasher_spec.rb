RSpec.describe HashComparator::Hasher do
  subject { described_class.hash(hash_function: :md5, human_readable_items: []) }

  it 'returns the thing' do
    expect(subject).to eq 'hey'
  end
end