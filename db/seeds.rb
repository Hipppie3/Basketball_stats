sport1 = Sport.create(name: "Basketball")
game1 = Game.create(name: "Game 1", date: "06/19/2023")
team1 = Team.create(name: "Team 1", sport_id: sport1.id)
p1 = Player.create(first_name: "Hiep", last_name: "Truong", sport_id: sport1.id, team_id: team1.id)

game_player1 = GamePlayer.create(game_id: game1.id, player_id: p1.id)

s1 = Statistic.create(w_l: "W", ppg: 2.1, rbg: 1.1, apg: 2.3, spg: 3.3, bpg: 0.3, fgm: 1, fga: 3, fg_percentage: 0.33, two_pm: 1, two_pa: 2, three_pm: 0, three_pa: 1, oreb: 2, dreb: 3, reb: 5, ast: 10, stl: 2, blk: 0, to: 4, pts: 2, player_id: p1.id)

v1 = Video.create(url: "https://www.youtube.com/watch?v=0cFH_T01mis", title: "Game 6/1/23", player_id: p1.id)

# db/seeds.rb

