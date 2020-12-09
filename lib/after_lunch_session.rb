class AfterLunchSession
    def initialize(start_time, end_time)
        @start_time = start_time
        @end_time = end_time
        @talks = []
        @remaining_time = (@end_time - @start_time) / 60
    end

    def is_full?
        @remaining_time == 0
    end

    def is_addable?(talk)
        @remaining_time - talk.duration >= 0
    end

    def add_talk(talk)
        @talks << talk
    end
end