# Comment out config.use_transactional_fixtures in rails/helper.rb This is configured in this file
# Add gem 'database_cleaner' to the test group and bundle
# In the spec folder, add a support folder containig this file
require 'database_cleaner'

RSpec.configure do |config|

  config.use_transactional_fixtures = false
 
  # Empty the database before each test file
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end