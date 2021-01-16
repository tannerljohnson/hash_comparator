require 'digest'

RSpec.describe HashComparator::Emails::Analyzer do
  subject { described_class.execute(hash_function: :md5, subject_raw_emails: subject_raw_emails, target_hashed_emails: target_hashed_emails, remove_username: true) }

  let(:subject_raw_emails) { ['john@gmail.com', 'addy@trailblazers.net', 'tom@hello.inc'] }
  let(:target_hashed_emails) { [hashed_email1, hashed_email2] }
  let(:hashed_email1) { Digest::MD5.hexdigest('hello.inc') }
  let(:hashed_email2) { Digest::MD5.hexdigest('yahoo.com') }

  it 'returns the thing' do
    expect(subject).to eq ['hello.inc']
  end
end