require "bundler/setup"
require "direct_upload"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all) do
    DirectUpload.configure do |config|
      config.aws_bucket_name = ENV['AWS_BUCKET_NAME']
    end
  end
end
