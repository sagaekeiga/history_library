for num in 1..20 do
Character.create!(name:  "西郷高森",
             life: "1999~2000",
             event: "日清戦争",
             url: "http://i.imgur.com/Na8HdtZ.jpg",
             description:              Faker::Lorem.sentence(500),
             era:              "春秋時代")
end

for num in 1..20 do
Era.create!(name:  "西郷高森",
             start: Date.today,
             closed: Date.today,
             description:              Faker::Lorem.sentence(500))
end

for num in 1..20 do
Event.create!(name:  "西郷高森",
             season: "1991",
             url: "http://i.imgur.com/Na8HdtZ.jpg",
             era: Date.today,
             character: "西郷高森",
             description:              Faker::Lorem.sentence(500))
end