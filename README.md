# HandyFeatureHelpers

Feature helpers for use with Capybara and Rspec

## Installation

Add this line to your application's Gemfile:

    gem 'handy_feature_helpers'

And then execute:

    $ bundle

Add to your spec_helper.rb: 

	RSpec.configure do |config|
      config.include HandyFeatureHelpers::Helpers, type: :feature
	end

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
