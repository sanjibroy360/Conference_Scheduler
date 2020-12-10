class Talk
  def self.register(subject, duration, is_pending = true)
    if duration == 5
      LightningTalk
    else
      NormalTalk
    end.new(subject, duration, is_pending)
  end
end

# Lightning talk

class LightningTalk < Talk
  attr_accessor :is_pending, :start_time
  attr_reader :subject, :duration

  def initialize(subject, duration, is_pending)
    @subject = subject
    @duration = duration
    @is_pending = is_pending
    @start_time = nil
  end
end

# Normal talk

class NormalTalk < Talk
  attr_accessor :is_pending, :start_time
  attr_reader :subject, :duration

  def initialize(subject, duration, is_pending)
    @subject = subject
    @duration = duration
    @is_pending = is_pending
    @start_time = nil
  end
end
