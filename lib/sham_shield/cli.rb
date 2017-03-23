require 'thor'

module ShamShield
  class CLI < Thor
    include Thor::Actions

    desc "wrap PROCESS", "Wraps PROCESS and texts the provided number a ship-it squirrel on completion"
    method_option :number, aliases: "-n", required: true, desc: "The mobile number to text"

    def wrap( process )
      say "Starting '#{process}'"
      run process
      say "Finished '#{process}'"
      say "Texting #{options[:number]}"
    end

    desc 'version', 'Prints version'
    def version
      say "ShamShield v#{VERSION}"
    end
    map %w(-v --version) => :version
  end
end