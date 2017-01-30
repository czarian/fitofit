puts "Creation user, and his activities"
puts "user email is 'test@test.com', password is 'password'"

user = User.find_or_create_by email: "test@test.com" do |user|
  user.password = "password"
end

activity = Activity.new

activity.start = 'Plac defilad 1, Warszawa, Polska'
activity.destination = 'Plac zamkowy 1, Warszawa, Polska'
activity.user = user
activity.save

activity = Activity.new

activity.start = 'Krakowskie przedmieście 2, Warszawa, Polska'
activity.destination = 'Plac zamkowy 1, Warszawa, Polska'
activity.user = user
activity.save


activity = Activity.new

activity.start = 'Plac trzech krzyży 1, Warszawa, Polska'
activity.destination = 'Plac zamkowy 1, Warszawa, Polska'
activity.user = user
activity.created_at = 2.week.ago.utc
activity.save

activity = Activity.new

activity.start = 'Plac grzybowski 2, Warszawa, Polska'
activity.destination = 'Plac zamkowy 1, Warszawa, Polska'
activity.user = user
activity.created_at = 2.days.ago.utc
activity.save

puts "Seeds generated"
