class TwilioClient
  
  def self.client
    Twilio::REST::Client.new ENV["account_sid"], ENV["auth_token"]
  end
end