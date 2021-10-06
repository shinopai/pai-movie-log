40.times do
  time = Faker::Number.between(from: 30, to: 180)
  memo = Faker::Lorem.sentence(15)
  created_at = Faker::Date.between(from: 1.days.ago - 1.day, to: Date.today)
  Movie.create({
    time: time,
    memo: memo,
    user_id: 3,
    created_at: created_at
  })
end