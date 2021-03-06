require_relative 'lib/hash_comparator/version'

Gem::Specification.new do |s|
	s.name						= 'hash_comparator'
	s.version					= HashComparator::VERSION
	s.date						= '2021-01-15'
	s.summary					= 'Compare sets of hashes for various purposes'
	s.description			= 'A common example is comparing customer lists between businesses, e.g., hashed unique email domains for users'
	s.authors					= ['Tanner Johnson']
	s.email						= 'johnsontanner3@gmail.com'
	s.files		 				= Dir['lib/**/*.rb']
  s.bindir					= 'exe'
  s.executables			= s.files.grep(%r({^exe/})) { |f| File.basename(f) }
  s.require_paths		= ['lib']
	s.homepage				= 'https://github.com/tannerljohnson/hash_comparator'
	s.license					= 'MIT'

	s.metadata["homepage_uri"] 		= s.homepage
	s.metadata["source_code_uri"] = s.homepage
	s.metadata["changelog_uri"] 	= s.homepage

  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.10'
end
