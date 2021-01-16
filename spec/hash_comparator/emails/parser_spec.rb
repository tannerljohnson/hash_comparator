RSpec.describe HashComparator::Emails::Parser do
  subject { described_class.parse(['john@google.com']) }

  it 'returns the thing' do
    expect(subject).to eq ['google.com']
  end
end