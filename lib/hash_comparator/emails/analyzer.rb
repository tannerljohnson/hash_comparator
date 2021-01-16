require 'hash_comparator/hasher'
require 'hash_comparator/set_comparator'

module HashComparator
  module Emails
    class Analyzer
      def self.execute(hash_function:, subject_raw_emails:, target_hashed_emails:)
        subject_hashed_emails = Hasher.hash(
          hash_function: hash_function,
          human_readable_items: subject_raw_emails
        )
        stats = SetComparator.calculate_overlap(subject_items: subject_hashed_emails, target_items: target_hashed_emails)
        'stats'
      end
    end
  end
end