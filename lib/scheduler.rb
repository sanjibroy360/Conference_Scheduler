require_relative "registered_talks"
require_relative "track"

class Scheduler
  include RegisteredTalks

  def initialize(track: Track)
    @tracks = [track.new(1), track.new(2)]
    @lightnig_talks, @normal_talks = RegisteredTalks::TALK_LIST.partition { |talk| talk.is_a? LightningTalk }
  end

  def add_talk_to_tracks_session(talks, session)
    while !talks.empty?
      talk = talks.first
      if !session.is_full? && session.is_addable?(talk)
        session.add_talk(talk)
        talks.shift()
      else
        break
      end
    end
  end

  def schedule_talk_session_wise(track, session)
    add_talk_to_tracks_session(@lightnig_talks, session)
    add_talk_to_tracks_session(@normal_talks, session)
  end

  def schedule_talks
    @normal_talks = @normal_talks.sort_by { |talk| talk.duration }
    @tracks.each do |track|
      schedule_talk_session_wise(track, track.morning_session)
      schedule_talk_session_wise(track, track.after_lunch_session)
    end
  end

  def show_result
    schedule_talks
    @tracks.each { |track| puts track.scheduled_talks }
    puts all_pending_talks
  end
end
