require_relative "morning_session"
require_relative "after_lunch_session"
require_relative "talk"

class Track
  attr_accessor :track_name, :morning_session, :after_lunch_session

  def initialize(track_number, morning_session: MorningSession, after_lunch_session: AfterLunchSession)
    @track_name = "Track #{Integer(track_number)}"
    @today = Time.now
    @day, @month, @year = @today.day, @today.month, @today.year
    @morning_session = morning_session.new(@day, @month, @year)
    @after_lunch_session = after_lunch_session.new(@day, @month, @year)
  end
end
