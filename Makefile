all: test doc

doc:
	git grep -h "^\s\+# \?" lib/slice/response.rb               | sed -E 's; +# ?;;' > doc/response.md
	git grep -h "^\s\+# \?" lib/slice/client.rb                 | sed -E 's; +# ?;;' > doc/client.md
	git grep -h "^\s\+# \?" lib/slice/resource_based_methods.rb | sed -E 's; +# ?;;' >> doc/client.md

release:
	bundle exec rake release

setup:
	gem install bundler
	bundle install

test:
	bundle exec rspec

.PHONY: doc release setup test
