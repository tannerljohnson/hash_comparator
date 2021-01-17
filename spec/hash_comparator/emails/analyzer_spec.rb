require 'digest'

RSpec.describe HashComparator::Emails::Analyzer do
  let(:subject_raw_emails) { ['john@gmail.com', 'addy@trailblazers.net', 'tom@hello.inc'] }
  let(:target_hashed_emails) { [hashed_email1, hashed_email2] }
  let(:options) { { parsing: { remove_usernames: true } } }
  let(:hashed_email1) { Digest::MD5.hexdigest('hello.inc') }
  let(:hashed_email2) { Digest::MD5.hexdigest('yahoo.com') }

  describe '#find_common_human_readable' do
    subject { described_class.find_common_human_readable(hash_function: :md5, subject_raw_emails: subject_raw_emails, target_hashed_emails: target_hashed_emails, options: options) }

    it 'returns the matches in human readable format' do
      expect(subject).to eq ['hello.inc']
    end
  end

  describe '#find_common_hashes' do
    subject { described_class.find_common_hashes(hash_function: :md5, subject_raw_emails: subject_raw_emails, target_hashed_emails: target_hashed_emails, options: options) }

    it 'returns the matches in hashed format' do
      expect(subject).to eq [hashed_email1]
    end
  end
end