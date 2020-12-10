require_relative "morning_session"
require_relative "after_lunch_session"

class Track
  attr_accessor :track_name, :morning_session, :after_lunch_session

  def initialize(track_number, morning_session: MorningSession, after_lunch_session: AfterLunchSession)
    @track_name = "Track #{Integer(track_number)}"
    @day, @month, @year = Time.now.day, Time.now.month, Time.now.year
    @morning_session = morning_session.new(@day, @month, @year)
    @after_lunch_session = after_lunch_session.new(@day, @month, @year)
  end

  def scheduled_talks
    all_talks = (@morning_session.talks + @after_lunch_session.talks)
    talk_info_strings = all_talks.map do |talk|
      "#{talk.start_time.strftime("%I:%M %p")} #{talk.subject}"
    end.join("\n")

    "\n#{@track_name}\n\n#{talk_info_strings}\n....."
  end
end
