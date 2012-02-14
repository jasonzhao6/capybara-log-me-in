# LogMeIn
LogMeIn is a handy assistant when testing third party providers (e.g. Facebook or Twitter) with Capybara.

LogMeIn opens the browser, creates or users a test user, yields control to your Capybara test, and then unauthorized or deletes the test user when you are done.

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

## Details

LogMeIn uses Capybara herself.

The |user| object yielded to you contains the following fields from the third party provider (e.g. Facebook: id, access_token, login_url, email, password, name, first_name, middle_name, last_name, link, gender, locale, updated_time).

If possible LogMeIn will delete the test users she creates because Facebook limits the number of test users you can have.
