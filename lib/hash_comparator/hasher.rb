require 'digest'

module HashComparator
  class Hasher
    SUPPORTED_HASH_FUNCTIONS = { md5: Digest::MD5 }.freeze

    def self.hash(hash_function:, human_readable_items:)
      new(hash_function: hash_function, human_readable_items: human_readable_items).hash
    end

    def initialize(hash_function:, human_readable_items:)
      @hash_function = SUPPORTED_HASH_FUNCTIONS[hash_function]
      @human_readable_items = human_readable_items
    end

    attr_accessor :hash_function, :human_readable_items

    def hash
      human_readable_items.map do |item|
        hash_function.hexdigest(item)
      end
    end
  end
end