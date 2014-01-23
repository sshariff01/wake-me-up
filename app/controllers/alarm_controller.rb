class AlarmController < ApplicationController
  def index
    if subscriber_signed_in?
      @alarms = Alarm.where("subscriber_id = ?", current_subscriber.id)
    end
      
  end
  
  def create
    fail = false
    params[:alarm].each do |p|
      @alarm = Alarm.new
      @alarm.subscriber_id = p[:subscriber_id]
      @alarm.hour = p[:hour]
      @alarm.minute = p[:minute]
      
      if not @alarm.save
          fail = true
      end
    end
    if not fail
      flash[:notice] = "You have successfully added an alarm!"
      redirect_to(:controller => 'alarm', :action => 'index') and return
    else
      flash[:notice] = "Your attempt to add an alarm was unsuccessful."
      redirect_to(:controller => 'alarm', :action => 'index') and return
    end
  end
  
  def destroy
    @alarm = Alarm.find(params[:id])
    if @alarm.destroy
      flash[:notice] = "You have successfully removed an alarm."
      redirect_to(:controller => 'alarm', :action => 'index') and return
    else
      flash[:notice] = "Your attempt to remove an alarm was unsuccessful."
      redirect_to(:controller => 'alarm', :action => 'index') and return
    end
  end
end
