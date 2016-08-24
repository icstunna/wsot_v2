class StockNotificationController < ApplicationController
  def index
    send_sms
    redirect_to root_url
  end

  private

  def send_sms
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

    message = @client.account.messages.create(
        :from => @twilio_number,
        :to => '+14155836647',
        :body => 'Hello Leandra! PART 3!'
      )
  end
end
