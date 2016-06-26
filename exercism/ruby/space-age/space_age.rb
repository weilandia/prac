class SpaceAge
  attr_reader :seconds
  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    (seconds / planet_yrs_in_secs[:earth]).round(2)
  end

  def on_mercury
    (seconds / planet_yrs_in_secs[:mercury]).round(2)
  end

  def on_venus
    (seconds / planet_yrs_in_secs[:venus]).round(2)
  end

  def on_mars
    (seconds / planet_yrs_in_secs[:mars]).round(2)
  end

  def on_jupiter
    (seconds / planet_yrs_in_secs[:jupiter]).round(2)
  end

  def on_saturn
    (seconds / planet_yrs_in_secs[:saturn]).round(2)
  end

  def on_uranus
    (seconds / planet_yrs_in_secs[:uranus]).round(2)
  end

  def on_neptune
    (seconds / planet_yrs_in_secs[:neptune]).round(2)
  end

private
  def planet_yrs_in_secs
    {earth:  31557600.0,
    mercury: 7600543.81992,
    venus:   19414149.052176,
    mars:    59354032.690079994,
    jupiter: 374355659.124,
    saturn:  929292362.8848,
    uranus:  2651370019.3296,
    neptune: 5200418560.032001}
  end
end
