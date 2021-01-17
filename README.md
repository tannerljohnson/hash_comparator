# Hash Comparator
This is for comparing sets of human readable data with sets of hashed data

## Pre-requisites
1. Hashed items
2. Human readable items
3. Hash algorithm used in #1

## Usage
```ruby
irb(main):022:0> emails = ["john@gmail.com", "eric@potsandflowers.com"]
=> ["john@gmail.com", "eric@potsandflowers.com"]
irb(main):023:0> hashes = ['jane@yahoo.com', 'eric@potsandflowers.com', 'john@gmail.com'].map { |e| Digest::MD5.hexdigest e }
=> ["0a028677b1fc578248759e697742841e", "e0a1eaa8d63e484adac998d53405fc10", "1f9d9a9efc2f523b2f09629444632b5c"]
irb(main):024:0> HashComparator::Emails::Analyzer.find_common_human_readable(hash_function: :md5, subject_raw_emails: emails, target_hashed_emails: hashes)
=> ["eric@potsandflowers.com", "john@gmail.com"]
irb(main):025:0> HashComparator::Emails::Analyzer.find_common_human_readable(hash_function: :md5, subject_raw_emails: emails, target_hashed_emails: hashes, options: {
parsing: { remove_generic_domains: true } })
=> ["eric@potsandflowers.com"]
irb(main):026:0> hashes = ['jane@yahoo.com', 'eric@potsandflowers.com', 'john@gmail.com'].map { |e| Digest::MD5.hexdigest e.split('@')[-1] }
=> ["50cd1a9a183758039b0841aa738c3f0b", "b8821919ecb75bb9bbd7399638787ef5", "f74d39fa044aa309eaea14b9f57fe79c"]
irb(main):027:0> HashComparator::Emails::Analyzer.find_common_human_readable(hash_function: :md5, subject_raw_emails: emails, target_hashed_emails: hashes)
=> []
irb(main):028:0> HashComparator::Emails::Analyzer.find_common_human_readable(hash_function: :md5, subject_raw_emails: emails, target_hashed_emails: hashes, options: {
parsing: { remove_usernames: true } })
=> ["gmail.com", "potsandflowers.com"]
irb(main):029:0> HashComparator::Emails::Analyzer.find_common_human_readable(hash_function: :md5, subject_raw_emails: emails, target_hashed_emails: hashes, options: {
parsing: { remove_generic_domains: true, remove_usernames: true } })
=> ["potsandflowers.com"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tannerljohnson/hash_comparator.