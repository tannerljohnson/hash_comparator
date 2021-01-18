require 'hash_comparator/hasher'
require 'hash_comparator/set_comparator'
require 'hash_comparator/emails/parser'
require 'hash_comparator/reverse_matcher'

module HashComparator
  module Emails
    class Analyzer
      def self.find_common_plaintext(hash_function:, subject_plaintext_emails:, target_hashed_emails:, options: {})
        new(
          hash_function: hash_function,
          subject_plaintext_emails: subject_plaintext_emails,
          target_hashed_emails: target_hashed_emails,
          options: options
        ).find_common_plaintext
      end

      def self.find_common_hashes(hash_function:, subject_plaintext_emails:, target_hashed_emails:, options: {})
        new(
          hash_function: hash_function,
          subject_plaintext_emails: subject_plaintext_emails,
          target_hashed_emails: target_hashed_emails,
          options: options
        ).find_common_hashes
      end

      def self.find_full_results(hash_function:, subject_plaintext_emails:, target_hashed_emails:, options: {})
        new(
          hash_function: hash_function,
          subject_plaintext_emails: subject_plaintext_emails,
          target_hashed_emails: target_hashed_emails,
          options: options
        ).find_full_results
      end

      def initialize(hash_function:, subject_plaintext_emails:, target_hashed_emails:, options:)
        @hash_function = hash_function
        @subject_plaintext_emails = subject_plaintext_emails
        @target_hashed_emails = target_hashed_emails
        @options = options
        @subject_hashed_emails = []
      end

      attr_accessor :hash_function, :subject_plaintext_emails, :subject_hashed_emails, :target_hashed_emails, :options

      def find_common_plaintext
        common_hashes = find_common_hashes
        reverse_match(common_hashes)
      end

      def find_common_hashes
        parse
        hash
        compare
      end

      def find_full_results
        common_hashed_emails = find_common_hashes
        common_plaintext_emails = reverse_match(common_hashed_emails)
        { common_hashed_emails: common_hashed_emails, common_plaintext_emails: common_plaintext_emails }
      end

      private

      def parse
        if options[:parsing]
          @subject_plaintext_emails = Parser.parse(subject_plaintext_emails, options[:parsing])
        end
      end

      def hash
        @subject_hashed_emails = Hasher.hash(
          hash_function: hash_function,
          plaintext_items: subject_plaintext_emails
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
          plaintext_items: subject_plaintext_emails
        )
      end
    end
  end
end