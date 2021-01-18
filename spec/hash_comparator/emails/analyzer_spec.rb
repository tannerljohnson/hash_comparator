require 'digest'

RSpec.describe HashComparator::Emails::Analyzer do
  let(:subject_plaintext_emails) { ['john@gmail.com', 'addy@trailblazers.net', 'tom@hello.inc'] }
  let(:target_hashed_emails) { [hashed_email1, hashed_email2] }
  let(:options) { { parsing: { remove_usernames: true } } }
  let(:hashed_email1) { Digest::MD5.hexdigest('hello.inc') }
  let(:hashed_email2) { Digest::MD5.hexdigest('yahoo.com') }

  describe '#find_common_plaintext' do
    subject { described_class.find_common_plaintext(hash_function: :md5, subject_plaintext_emails: subject_plaintext_emails, target_hashed_emails: target_hashed_emails, options: options) }

    it 'returns the matches in plaintext format' do
      expect(subject).to eq ['hello.inc']
    end
  end

  describe '#find_common_hashes' do
    subject { described_class.find_common_hashes(hash_function: :md5, subject_plaintext_emails: subject_plaintext_emails, target_hashed_emails: target_hashed_emails, options: options) }

    it 'returns the matches in hashed format' do
      expect(subject).to eq [hashed_email1]
    end
  end

  describe '#find_full_results' do
    subject { described_class.find_full_results(hash_function: :md5, subject_plaintext_emails: subject_plaintext_emails, target_hashed_emails: target_hashed_emails, options: options) }

    it 'returns the matches in hashed and plaintext format' do
      expect(subject).to eq(common_hashed_emails: [hashed_email1], common_plaintext_emails: ['hello.inc'])
    end
  end
end