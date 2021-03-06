require 'digest'
require 'hash_comparator/hasher'

module HashComparator
  class ReverseMatcher
    def self.execute(hash_function:, hashed_items:, plaintext_items:)
      new(
        hash_function: hash_function,
        hashed_items: hashed_items,
        plaintext_items: plaintext_items
      ).execute
    end

    def initialize(hash_function:, hashed_items:, plaintext_items:)
      @hash_function = hash_function
      @plaintext_items = plaintext_items
      @hashed_items = hashed_items
    end

    attr_accessor :hash_function, :plaintext_items, :hashed_items

    def execute
      subject_hashed_items = Hasher.hash(
        hash_function: hash_function,
        plaintext_items: plaintext_items
      )

      matches = plaintext_items.each_with_index.each_with_object([]) do |(item, i), list|
        list << item if hashed_items.include?(subject_hashed_items[i])
      end
      
      matches.uniq.sort
    end
  end
end