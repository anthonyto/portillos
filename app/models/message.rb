class Message < ActiveRecord::Base
  
  def self.outbound(to)
    TwilioClient.client.account.messages.create({
      to: to,
      from: '+18582390241',
      body: 'testing',
      media_url: 'http://i.imgur.com/DX4qfJz.jpg'
    })
    Message.create(from: '+18582390241', to: to, body: 'testing', media_url: 'http://i.imgur.com/DX4qfJz.jpg')
  end
  
end