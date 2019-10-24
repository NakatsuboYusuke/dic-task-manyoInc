100.times do |n|
  title = Faker::JapaneseMedia::DragonBall.character
  description = Faker::JapaneseMedia::OnePiece.character
  limited_at = Faker::Date.between(from: 2.days.ago, to: Date.today)
  status = 0
  Task.create!(title: title,
               description: description,
               limited_at: limited_at,
               status: status,
               )
end