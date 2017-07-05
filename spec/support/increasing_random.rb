class IncreasingRandom
  attr_reader :value

  def initialize(value = rand(1..100))
    @value = value
  end

  def next
    next_value = value + rand(1..100)
    IncreasingRandom.new(next_value)
  end

  def to_s
    value.to_s
  end
end
