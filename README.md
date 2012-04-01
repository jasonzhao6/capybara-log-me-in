# Capybara::LogMeIn
LogMeIn is a handy assistant that logs into your app with a Facebook or Twitter test account. It's useful when writing Capybara-based browser tests.

Wrap your test code in its block, it will open the browser, create a test user, yield control to your code, and then delete the test user.

It creates/deletes a new test user each time for Facebook, but because Twitter doesn't offer such an API, for Twitter, it authorizes/deauthorizes app permission with the same user each time.

## Usage
```ruby
require 'capybara-log-me-in'

Capybara::LogMeIn.config :facebook, { api_key: 'test_key', secret: 'test_secret' }

Capybara::LogMeIn.to :facebook do |user|
  // Yield begins
  visit 'http://www.facebook.com/'
  page.should have_content(user.name)
  // Yield ends
end
```