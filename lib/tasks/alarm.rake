desc "This task is called by the Heroku scheduler add-on to send SMS alarms powered by Twilio"
task :send_message => :environment do
  puts "Checking for Alarms to Trigger..."
  time = Time.now.in_time_zone("Eastern Time (US & Canada)")
  alarms = Alarm.where("hour = ? AND minute = ?", time.hour, time.min)
  
  if !alarms.empty?
    alarms.each do |alarm|
      message = "Jenny please?! I love you <3. This was supposed to be sent at " + alarm.hour + ":" + alarm.minute + "."
      alarm.alert(message)
    end
  end
  
  puts "Done."
end
