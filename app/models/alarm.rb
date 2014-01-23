class Alarm < ActiveRecord::Base
  belongs_to :subscriber
  
  def alert(message, phone_num)
    account_sid = 'AC01cff19430ab417d4eac4c9fe60c4de3'
    auth_token = '5b1ae4887b6088b05f1a749b2ba79560'
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    sms = @client.account.sms.messages.create(:body => message,
        :to => phone_num,
        :from => "+12892362295")
    puts sms.from
  end
end
