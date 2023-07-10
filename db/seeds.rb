p1 = Player.create(first_name: "Hiep", last_name: "Truong")

s1 = Statistic.create(game_date: nil, matchup: "White vs Blue", w_l: "W", ppg: 2.1, rbg: 1.1, apg: 2.3, spg: 3.3, bpg: 0.3, fgm: 1, fga: 3, fg_percentage: 0.33, two_pm: 1, two_pa: 2, three_pm: 0, three_pa: 1, oreb: 2, dreb: 3, reb: 5, ast: 10, stl: 2, blk: 0, to: 4, pts: 2, player_id: p1.id)

v1 = Video.create(url: "https://www.youtube.com/watch?v=0cFH_T01mis", title: "Game 6/1/23", player_id: p1.id)

# db/seeds.rb

# Create a regular user
User.create!(
  name: 'Daniel',
  email: 'Daniel@yahoo.com',
  password: '123456',
  password_confirmation: '123456'
)

# Create an admin user
admin_user = User.create!(
  name: 'Daniel Truong',
  email: 'Daniel@yahoo.com',
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD'],
  admin: true
)

puts 'Seed data created successfully.'
