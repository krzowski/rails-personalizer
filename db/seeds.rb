user = User.create(email: "testaccount@example.com", password: "qwerty")


date = Date.today - 10.days
40.times do
  activity = user.daily_activities.create(date: date)
  5.times { |i| activity.foods.create(name: "food-#{i+1}", calories: (rand(200) + 100)) }
  5.times { |i| activity.exercises.create(name: "exercise-#{i+1}", calories: rand(100)) }

  date = date + 1.day
end