100.times do |n|
  title = Faker::JapaneseMedia::DragonBall.character
  description = Faker::JapaneseMedia::OnePiece.character
  limited_at = Faker::Date.between(from: 10.days.ago, to: Date.today)
  status = rand(0..2)
  priority = rand(0..2)
  Task.create!(title: title,
               description: description,
               limited_at: limited_at,
               status: status,
               priority: priority,
               )
end