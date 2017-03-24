require "bundler/setup"
require "sham_shield"

ENV['TEST'] = 'true'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def swallow(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end
  end
end

RSpec::Matchers.define :exit_with_status do |expected|
  match do |actual|
    expect { actual.call }.to raise_error(SystemExit)

    begin
      actual.call
    rescue SystemExit => e
      expect(e.status).to eq expected
    end
  end

  supports_block_expectations
end
