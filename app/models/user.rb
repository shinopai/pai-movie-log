class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # relation
  has_many :movies, dependent: :destroy

  # get movies period
  def movies_period(period)
    current = Time.current.beginning_of_day 
    case period 
    when 'week'
      start_date = current.ago(6.days)
    when 'month'
      start_date = current.ago(1.month - 1.day)
    when 'year'
      start_date = current.ago(1.year - 1.day)
    else
      start_date = current.ago(6.days)
    end
    end_date = Time.current
    dates = {}
    (start_date.to_datetime...end_date.to_datetime).each do |date|
      chart_movies = self.movies.where(created_at: date.beginning_of_day...date.end_of_day)
      sum_times = chart_movies.sum(:time)
      dates.store(date.to_date.to_s, sum_times)
    end
  return dates
end
end
