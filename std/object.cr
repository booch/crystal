class Object
  macro self.getter(name)"
    def #{name}
      @#{name}
    end
  "end

  macro self.setter(name)"
    def #{name}=(@#{name})
    end
  "end

  macro self.property(name)"
    getter :#{name}
    setter :#{name}
  "end

  def !=(other)
    !(self == other)
  end

  def ===(other)
    self == other
  end

  def inspect
    to_s
  end

  def tap
    yield self
    self
  end

  def instance_eval
    self.yield
  end
end
