require "sham_shield/version"
require "sham_shield/cli"
require "twilio-ruby"

module ShamShield

  # https://github.com/hubot-scripts/hubot-shipit/blob/master/src/shipit.coffee#L19-L34
  # filtered by 200s at https://httpstatus.io/ at 2017-03-23
  SQUIRRELS = [
    "http://i.imgur.com/DPVM1.png",
    "http://d2f8dzk2mhcqts.cloudfront.net/0772_PEW_Roundup/09_Squirrel.jpg",
    "http://1.bp.blogspot.com/_v0neUj-VDa4/TFBEbqFQcII/AAAAAAAAFBU/E8kPNmF1h1E/s640/squirrelbacca-thumb.jpg",
    "http://shipitsquirrel.github.io/images/ship%20it%20squirrel.png",
    "http://www.cybersalt.org/images/funnypictures/s/supersquirrel.jpg",
    "https://dl.dropboxusercontent.com/u/602885/github/sniper-squirrel.jpg",
    "https://dl.dropboxusercontent.com/u/602885/github/soldier-squirrel.jpg",
    "https://dl.dropboxusercontent.com/u/602885/github/squirrelmobster.jpeg"
  ]

  Twilio.configure do |config|
    config.account_sid = ENV['TWILIO_SID']
    config.auth_token = ENV['TWILIO_TOKEN']
  end
end
