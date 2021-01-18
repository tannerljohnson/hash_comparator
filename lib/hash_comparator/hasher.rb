require 'digest'

module HashComparator
  class Hasher
    SUPPORTED_HASH_FUNCTIONS = {
      md5: Digest::MD5,
      sha1: Digest::SHA1,
      sha256: Digest::SHA2,
      sha512: Digest::SHA512
    }.freeze

    def self.hash(hash_function:, plaintext_items:)
      new(hash_function: hash_function, plaintext_items: plaintext_items).hash
    end

    def initialize(hash_function:, plaintext_items:)
      @hash_function = SUPPORTED_HASH_FUNCTIONS[hash_function]
      @plaintext_items = plaintext_items
    end

    attr_accessor :hash_function, :plaintext_items

    def hash
      plaintext_items.map do |item|
        hash_function.hexdigest(item)
      end
    end
  end
end