class Numeric
  def step(limit, step)
    x = self
    while x <= limit
      yield x
      x += step
    end
  end

  def abs
    self < 0 ? -self : self
  end

  def <=>(other)
    self - other
  end
end