desc "This task is called by the Heroku scheduler add-on to send SMS alarms powered by Twilio"
task :trigger_alarms => :environment do
  puts "Checking for Alarms to Trigger..."
  time = Time.now.in_time_zone("Eastern Time (US & Canada)")
  alarms = Alarm.where("hour = ? AND minute = ?", time.hour, time.min)
  
  if !alarms.empty?
    alarms.each do |alarm|
      subscriber = Subscriber.find(alarm.subscriber_id)
      phone_num = subscriber.phone_number
      alarm.alert(alarm.body, phone_num)
    end
  end
  
  puts "Done."
end
