class Message < ActiveRecord::Base

  scope :from_other_numbers, -> { where("from_number NOT LIKE '+18582390241'")}

  def self.outbound(to)
    portillos_image = PortillosPicker.new.options.sample
    begin
      TwilioClient.client.account.messages.create({
        to: to,
        from: '+18582390241',
        media_url: portillos_image
      })
      Message.create(from_number: '+18582390241', to_number: to, body: 'testing', media_url: 'portillos_image')
    rescue => e
    end
  end

end
