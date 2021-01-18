require 'digest'

RSpec.describe HashComparator::Hasher do
  subject { described_class.hash(hash_function: hash_function, plaintext_items: [sample_item]) }

  let(:sample_item) { 'hello-world' }
  let(:expected_digest) { Digest::MD5.hexdigest(sample_item) }
  let(:hash_function) { :md5 }

  context 'md5' do
    it 'returns the correct digest' do
      expect(subject).to eq [expected_digest]
    end
  end

  context 'sha1' do
    let(:expected_digest) { Digest::SHA1.hexdigest(sample_item) }
    let(:hash_function) { :sha1 }

    it 'returns the correct digest' do
      expect(subject).to eq [expected_digest]
    end
  end

  context 'sha256' do
    let(:expected_digest) { Digest::SHA2.hexdigest(sample_item) }
    let(:hash_function) { :sha256 }

    it 'returns the correct digest' do
      expect(subject).to eq [expected_digest]
    end
  end

  context 'sha512' do
    let(:expected_digest) { Digest::SHA512.hexdigest(sample_item) }
    let(:hash_function) { :sha512 }

    it 'returns the correct digest' do
      expect(subject).to eq [expected_digest]
    end
  end
end