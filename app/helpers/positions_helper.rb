module PositionsHelper
  def position_total(hours, rate)
    hours.to_f * rate.to_f
  end
end
