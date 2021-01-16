# compare_hashed_emails
This is for comparing hashed gusto emails with hashed partner emails to identify customer overlap

## Pre-requisites
1. A .txt or .csv file with gusto emails
2. A .txt or .csv file with hashed partner emails
3. Hash algorithm used in #2

## Steps to use
1. Clone this repository
2. Specify hash algorithm in `src/main.rb` params for pre-requisites (3)
3. Specify input/output files in `src/constants.rb`
4. Run `ruby main.rb` to generate common hashes
5. Run `ruby reverse_match.rb` to generate human readable common domain names

Optionally, you can choose to include generic email domains with the `exclude_common_domains` flag in `HashEmails`

Example output
```
$ ruby main.rb
Partner total hashed emails: 4
Our total hashed emails: 5
Number of hashes in both sets: 1
Percentage partner overlap (both / partner total) = (1/4)
See ../files/common_hashes.txt for a list of matched hashes
(Run `ruby reverse_match.rb` to generate a human readable file of matched domains)
```

For reverse match
```
$ ruby reverse_match.rb
Reverse matching common gusto/partner domain hashes...
Reverse matching complete.
Found 1 match.
See ../files/common_human_readable.txt
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tannerljohnson/hash_comparator.