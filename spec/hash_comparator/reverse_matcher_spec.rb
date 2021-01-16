require 'digest'

RSpec.describe HashComparator::ReverseMatcher do
  subject { described_class.execute(hash_function: :md5, human_readable_items: [sample_item], hashed_items: [expected_digest]) }

  let(:sample_item) { 'hello-world' }
  let(:expected_digest) { Digest::MD5.hexdigest(sample_item) }

  it 'returns the thing' do
    expect(subject).to eq [sample_item]
  end
end