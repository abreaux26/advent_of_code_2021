class Number
  attr_reader :number, :marked

  def initialize(number)
    @number = number
    @marked = false
  end

  def mark_number
    @marked = true
  end

  def marked?
    @marked
  end
end
