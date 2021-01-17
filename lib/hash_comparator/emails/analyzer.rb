require 'hash_comparator/hasher'
require 'hash_comparator/set_comparator'
require 'hash_comparator/emails/parser'
require 'hash_comparator/reverse_matcher'

module HashComparator
  module Emails
    class Analyzer
      def self.find_common_human_readable(hash_function:, subject_raw_emails:, target_hashed_emails:, options: {})
        new(
          hash_function: hash_function,
          subject_raw_emails: subject_raw_emails,
          target_hashed_emails: target_hashed_emails,
          options: options
        ).find_common_human_readable
      end

      def self.find_common_hashes(hash_function:, subject_raw_emails:, target_hashed_emails:, options: {})
        new(
          hash_function: hash_function,
          subject_raw_emails: subject_raw_emails,
          target_hashed_emails: target_hashed_emails,
          options: options
        ).find_common_hashes
      end

      def initialize(hash_function:, subject_raw_emails:, target_hashed_emails:, options:)
        @hash_function = hash_function
        @subject_raw_emails = subject_raw_emails
        @target_hashed_emails = target_hashed_emails
        @options = options
        @subject_hashed_emails = []
      end

      attr_accessor :hash_function, :subject_raw_emails, :subject_hashed_emails, :target_hashed_emails, :options

      def find_common_human_readable
        common_hashes = find_common_hashes
        reverse_match(common_hashes)
      end

      def find_common_hashes
        parse
        hash
        compare
      end

      private

      def parse
        if options[:parsing]
          @subject_raw_emails = Parser.parse(subject_raw_emails, options[:parsing])
        end
      end

      def hash
        @subject_hashed_emails = Hasher.hash(
          hash_function: hash_function,
          human_readable_items: subject_raw_emails
        )
      end

      def compare
        SetComparator.calculate_overlap(
          subject_items: subject_hashed_emails,
          target_items: target_hashed_emails
        )
      end

      def reverse_match(common_hashes)
        ReverseMatcher.execute(
          hash_function: hash_function,
          hashed_items: common_hashes,
          human_readable_items: subject_raw_emails
        )
      end
    end
  end
end