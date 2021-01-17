require 'hash_comparator/hasher'
require 'hash_comparator/set_comparator'
require 'hash_comparator/emails/parser'
require 'hash_comparator/reverse_matcher'

module HashComparator
  module Emails
    class Analyzer
      def self.find_common_human_readable(hash_function:, subject_raw_emails:, target_hashed_emails:, options:)
        if options[:parsing]
          subject_raw_emails = Parser.parse(subject_raw_emails, options[:parsing])
        end

        subject_hashed_emails = Hasher.hash(
          hash_function: hash_function,
          human_readable_items: subject_raw_emails
        )
        hashed_common_emails = SetComparator.calculate_overlap(
          subject_items: subject_hashed_emails,
          target_items: target_hashed_emails
        )

        ReverseMatcher.execute(
          hash_function: hash_function,
          hashed_items: hashed_common_emails,
          human_readable_items: subject_raw_emails
        )
      end

      def self.find_common_hashes(hash_function:, subject_raw_emails:, target_hashed_emails:, options:)
        if options[:parsing]
          subject_raw_emails = Parser.parse(subject_raw_emails, options[:parsing])
        end

        subject_hashed_emails = Hasher.hash(
          hash_function: hash_function,
          human_readable_items: subject_raw_emails
        )

        SetComparator.calculate_overlap(
          subject_items: subject_hashed_emails,
          target_items: target_hashed_emails
        )
      end
    end
  end
end