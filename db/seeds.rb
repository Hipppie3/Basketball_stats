require 'cloudinary'

p1 = Player.create(first_name: "Daniel", last_name: "Truong", height: "5'4", age: 33, college: "CSULB", birthday: nil, job: "NBA", country: "USA", cloudinary_image_public_id: Cloudinary::Uploader.upload(Rails.root.join('app', 'assets', 'images', 'daniel.png'))['public_id']
)
# p2 = Player.create(first_name: "kenjihiep", last_name: "Yamazawa", height: "5'8", age: 37,
# college: nil, birthday: nil, job: "Mechanical Engineer", country: "USA", image: "https://imgur.com/NPSjBWe.png")
# p3 = Player.create(first_name: "hiebert", last_name: "Ike", height: "5'8", age: 37, college: nil, birthday: nil, job: "Nurse", country: "USA", image: "https://imgur.com/PrBIQo7.png")
# p4 = Player.create(first_name: "Mike", last_name: "Phan", height: "5'10", age: 37, college: nil, birthday: nil, job: "Banking", country: "USA", image: "https://imgur.com/nI1Gb5X.png")
# p5 = Player.create(first_name: "Matthiep", last_name: "Tran", height: "5'10", age: 37, college: nil, birthday: nil, job: "Automobile", country: "USA", image: "https://imgur.com/KzMouTe.png")
# p6 = Player.create(first_name: "hiepeter", last_name: "Vu", height: "5'10", age: 37, college: nil, birthday: nil, job: "Amazon", country: "USA", image: "https://imgur.com/TbJcPaY.png")
# p7 = Player.create(first_name: "Lynn haiep", last_name: "Ha", height: "5'3", age: 37, college: nil, birthday: nil, job: "NFL", country: "USA", image: "https://imgur.com/yKNF4vY.png")

# i1 = Information.create(team: "Park Crew", position: "Point Guard", number: 0, player_id: p1.id)
# i2 = Information.create(team: "Park Crew", position: "Guard", number: 8, player_id: p2.id)
# i3 = Information.create(team: "Park Crew", position: "Forward", number: 24, player_id: p3.id)
# i4 = Information.create(team: "Park Crew", position: "Center", number: 11, player_id: p4.id)
# i5 = Information.create(team: "Park Crew", position: "Forward", number: 3, player_id: p5.id)
# i6 = Information.create(team: "Park Crew", position: "Center", number: 33, player_id: p6.id)
# i7 = Information.create(team: "Park Crew", position: "Point Guard", number: 23, player_id: p7.id)

# s1 = Stat.create(game_date: nil, matchup: nil, w_l: "W", ppg: 1, rbg: 5, apg: nil, spg: nil, bpg: nil, fgm: 1, fga: 5, fg_percentage: 20, two_pm: nil, two_pa: 3, three_pm: 1, three_pa: 2, oreb: 2, dreb: 3, reb: 5, ast: 2, stl: 2, blk: nil, to: nil, pts: 2, player_id: p1.id)
# s2 = Stat.create(game_date: nil, matchup: nil, w_l: "L", ppg: 5, rbg: 15, apg: nil, spg: nil, bpg: nil, fgm: 5, fga: 15, fg_percentage: 33, two_pm: 2, two_pa: 6, three_pm: 3, three_pa: 9, oreb: 1, dreb: 4, reb: 5, ast: 2, stl: nil, blk: nil, to: 2, pts: 8, player_id: p2.id)
# s3 = Stat.create(game_date: nil, matchup: nil, w_l: "L", ppg: 0, rbg: 3, apg: nil, spg: nil, bpg: nil, fgm: 0, fga: 3, fg_percentage: 0, two_pm: nil, two_pa: 2, three_pm: nil, three_pa: 1, oreb: nil, dreb: 1, reb: 1, ast: 1, stl: 1, blk: 3, to: nil, pts: 1, player_id: p3.id)
# s4 = Stat.create(game_date: nil, matchup: nil, w_l: "W", ppg: 2, rbg: 10, apg: nil, spg: nil, bpg: nil, fgm: 2, fga: 10, fg_percentage: 20, two_pm: 1, two_pa: 7, three_pm: 1, three_pa: 3, oreb: 1, dreb: 1, reb: 2, ast: nil, stl: nil, blk: nil, to: nil, pts: 3, player_id: p4.id)
# s5 = Stat.create(game_date: nil, matchup: nil, w_l: "W", ppg: 1, rbg: 8, apg: nil, spg: nil, bpg: nil, fgm: 1, fga: 8, fg_percentage: 13, two_pm: 1, two_pa: 4, three_pm: nil, three_pa: 4, oreb: nil, dreb: 2, reb: 7, ast: 9, stl: 1, blk: 1, to: nil, pts: 1, player_id: p5.id)
# s6 = Stat.create(game_date: nil, matchup: nil, w_l: "L", ppg: 0, rbg: 2, apg: nil, spg: nil, bpg: nil, fgm: 0, fga: 2, fg_percentage: 0, two_pm: nil, two_pa: 2, three_pm: nil, three_pa: nil, oreb: 2, dreb: 3, reb: 5, ast: 2, stl: 1, blk: 1, to: nil, pts: 0, player_id: p6.id)
# s7 = Stat.create(game_date: nil, matchup: nil, w_l: nil,ppg: nil,rbg: nil,apg: nil,spg: nil,bpg: nil,fgm: nil,fga: nil,fg_percentage: nil,two_pm: nil,two_pa: nil,three_pm: nil,three_pa: nil,oreb: nil,dreb: nil,reb: nil,ast: nil,stl: nil,blk: nil,to: nil,pts: nil, player_id: p7.id)