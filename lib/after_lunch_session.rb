require_relative "validator_and_adder"

class AfterLunchSession
  include ValidatorAndAdder
  attr_accessor :talks

  def initialize(day, month, year, start_time = 13, end_time = 17)
    @start_time = Time.local(year, month, day, start_time)
    @end_time = Time.local(year, month, day, end_time)
    @talks = []
    @remaining_time = (@end_time - @start_time) / 60
  end
end
