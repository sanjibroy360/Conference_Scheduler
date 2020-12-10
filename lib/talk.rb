class Talk
  def self.register(subject, duration)
    if duration == 5
      LightningTalk
    else
      NormalTalk
    end.new(subject, duration)
  end
end

# Lightning talk

class LightningTalk < Talk
  attr_accessor :start_time
  attr_reader :subject, :duration

  def initialize(subject, duration)
    @subject = subject
    @duration = duration
    @start_time = nil
  end
end

# Normal talk

class NormalTalk < Talk
  attr_accessor :start_time
  attr_reader :subject, :duration

  def initialize(subject, duration)
    @subject = subject
    @duration = duration
    @start_time = nil
  end
end
