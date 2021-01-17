require 'digest'

RSpec.describe HashComparator::Hasher do
  subject { described_class.hash(hash_function: :md5, human_readable_items: [sample_item]) }

  let(:sample_item) { 'hello-world' }
  let(:expected_digest) { Digest::MD5.hexdigest(sample_item) }

  it 'returns the digest' do
    expect(subject).to eq [expected_digest]
  end
end