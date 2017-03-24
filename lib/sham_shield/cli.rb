require 'thor'

module ShamShield
  class CLI < Thor
    include Thor::Actions

    desc "wrap 'PROCESS'", "Wraps PROCESS and texts the provided number a ship-it squirrel on completion"
    method_option :number, aliases: "-n", required: true, desc: "The mobile number to text"
    def wrap( process )
      @client = Twilio::REST::Client.new

      say "Starting '#{process}'"
      run process, capture: !ENV['TEST'].nil?
      say "Finished '#{process}'"

      say "Texting #{options[:number]}"

      @client.messages.create(
        from: "+1#{ENV['TWILIO_NUMBER']}",
        to: "+1#{options[:number]}",
        body: "Finished '#{process}'",
        media_url: SQUIRRELS.sample
      )
    end

    desc 'version', 'Prints version'
    def version
      say "ShamShield v#{VERSION}"
    end
    map %w(-v --version) => :version
  end
end