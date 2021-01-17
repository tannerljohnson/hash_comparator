RSpec.describe HashComparator::Emails::Parser do
  let(:emails) { ['john@google.com', 'jane@yahoo.com', 'erin@potsandflowers.com'] }
  let(:options) { {} }

  subject { described_class.parse(emails, options) }

  context 'with no options' do
    it 'returns the emails unparsed' do
      expect(subject).to eq emails
    end
  end

  context 'when remove_usernames is true' do
    let(:options) { { remove_usernames: true } }

    it 'returns the emails with the usernames removed' do
      expect(subject).to eq ['google.com', 'yahoo.com', 'potsandflowers.com']
    end
  end

  context 'when remove_generic_domains is true' do
    let(:options) { { remove_generic_domains: true } }

    it 'returns the emails with the generic domains removed' do
      expect(subject).to eq ['erin@potsandflowers.com']
    end
  end

  context 'when remove_generic_domains and remove_usersnames are both true' do
    let(:options) { { remove_generic_domains: true, remove_usernames: true } }

    it 'returns the domains with the generic domains removed' do
      expect(subject).to eq ['potsandflowers.com']
    end
  end
end