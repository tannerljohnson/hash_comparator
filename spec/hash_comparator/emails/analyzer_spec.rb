RSpec.describe HashComparator::Emails::Analyzer do
  subject { described_class.execute(hash_function: :md5, subject_raw_emails: [], target_hashed_emails: []) }

  it 'returns the thing' do
    expect(subject).to eq 'stats'
  end
end