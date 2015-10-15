require 'rubygems'
require 'twilio-ruby'
require 'yaml'

# Moving configuration settings to a separate hash available throughout the application
SETTINGS = YAML.load(File.read(File.expand_path('../../config/settings.yml', __FILE__)))

begin
  @client = Twilio::REST::Client.new SETTINGS['twilio_sid'], SETTINGS['twilio_auth_token']

  message = @client.account.messages.create(
    :body => "This is a test of the In The Pocket Emergency Broadcast system...",
    :to => "7147463354",
    :from => "2673172682"
  )
rescue Twilio::REST::RequestError => e
  puts e.message
end

# TODO check out guide here https://www.twilio.com/blog/2014/02/twilio-on-rails-integrating-twilio-with-your-rails-4-app.html
