cur_dir = File.dirname(File.absolute_path(__FILE__))
Dir.glob(cur_dir + '/../lib/*', &method(:require))

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end

end
