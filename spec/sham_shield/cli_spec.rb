require "spec_helper"

RSpec.describe ShamShield::CLI do
  let :subject do
    described_class.new
  end

  it 'has a version' do
    expect { subject.version }.to output(/^ShamShield v#{ShamShield::VERSION}$/).to_stdout
  end
end