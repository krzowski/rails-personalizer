user = User.create(email: "testaccount@example.com", password: "qwerty")


date = Date.today - 10.days
40.times do
  activity = user.daily_activities.create(date: date)
  5.times do { |i| activity.foods.create("food-#{i}", calories: (rand(200) + 100)) }
  5.times do { |i| activity.exercises.create("exercise-#{i}", calories: (rand(200) + 100)) }
  end
  date = date + 1.day
end