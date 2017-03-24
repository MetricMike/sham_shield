require "spec_helper"

FAKE_NUMBER = "5005550001" # Always fails
MAGIC_NUMBER = "5005550006" # Validates input, always succeeds
MAGIC_COMMAND = "echo foobar"

RSpec.describe ShamShield::CLI do
  let(:subject) { described_class.new }

  describe 'wrap' do
    let(:output)  { swallow(:stdout) { subject.wrap MAGIC_COMMAND } }
    context 'with a number option' do

      context 'when invalid' do
        it 'will fail' do
          ENV['TWILIO_NUMBER'] = FAKE_NUMBER
          subject.options = { number: MAGIC_NUMBER }
          expect { output }.to raise_error(Twilio::REST::RequestError)
        end
      end

      context 'when valid' do
        it 'will succeed' do
          ENV['TWILIO_NUMBER'] = MAGIC_NUMBER
          subject.options = { number: MAGIC_NUMBER }
          expect { output }.not_to raise_error
        end
      end

    end

    context 'without a number option' do
      it 'will always fail' do
        expect { output }.to raise_error(Twilio::REST::RequestError)
      end
    end
  end

  describe 'version' do
    it 'prints the version' do
      expect { subject.version }.to output(/^ShamShield v#{ShamShield::VERSION}$/).to_stdout
    end
  end
end