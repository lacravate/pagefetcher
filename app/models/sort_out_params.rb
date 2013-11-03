module SortOutParams

  # sort out parameter, rationalize a bit, and go
  def create_with_raw_data(data)
    if data.is_a? Hash
      create chipchip(data).slice(*self::MANAGED_ATTRIBUTES)
    end
  end

  # this is overloaded to do something else than that...
  def chipchip(data)
    data
  end

end
