module UsersHelper
  def sum_times
    @chart_movies.values.inject(:+) unless @chart_movies.nil?
  end

  def to_hour
    hour = sum_times / 60.0
    hour.round(2) 
  end
end
