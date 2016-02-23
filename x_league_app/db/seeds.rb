# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Performance.destroy_all
Game.destroy_all
Player.destroy_all
Team.destroy_all

# team1 = Team.create(name: "BYOB", division: "Amateur")
# team2 = Team.create(name: "BYOJ", division: "Amateur")

# team1.players.create(name: "Jerry", player_number: "24")
# team2.players.create(name: "Berry", player_number: "42")

# game1 = Game.create(date: Date.today, game_number: "1", home_team: team1, away_team: team2)
# game2 = Game.create(date: Date.today, game_number: "2", home_team: team2, away_team: team1)

# performance1 = Performance.create(pts: 100, game_id: Game.first.id, player_id: Player.first.id)

file = File.read("data/stats_s15.json")
hash = JSON.parse file

def self.team_exists(name)
  Team.find_by(name: name)
end

def self.player_exists(player_number, team_id)
  Player.find_by(player_number: player_number, team_id: team_id)
end

def self.create_team(name)
  Team.create(name: name).id
end

def self.add_performance(player, team_name, game_id)
  team_id = Team.find_by(name: team_name).id
  player_id = Player.create(
    name: player["name"],
    player_number: player["pnumber"],
    team_id: team_id).id unless player_exists(player["pnumber"], team_id)
  player_id ||= Player.find_by(player_number: player["pnumber"], team_id: team_id).id
  Performance.create(
    game_id: game_id,
    player_id: player_id,
    pts: player["points"]
  )
end

# Access player numbers
# hash["w1"]["games"]["g1"]["teams"]["t1"]["players"]['p1']['pnumber']
# "w1" use .each
# "g1" use .each
# "t1" use .each
# "p1" use .each


# for each week
hash.each do |wk, v|
  dt = v["date"]
  games = v["games"]
  games.each do |k, game|
    if game.has_key? "forfeit"
      loser_id = create_team(game["loser"]) unless team_exists(game["loser"])
      winner_id = create_team(game["winner"]) unless team_exists(game["winner"])
      loser_id ||= Team.find_by(name: game["loser"]).id
      winner_id ||= Team.find_by(name: game["winner"]).id
      game_id = Game.create(date: dt, game_number: game["number"], forfeit: true, home_id: winner_id, away_id: loser_id).id
    else
      t1_id = create_team(game["teams"]["t1"]["name"]) unless team_exists(game["teams"]["t1"]["name"])
      t2_id = create_team(game["teams"]["t2"]["name"]) unless team_exists(game["teams"]["t2"]["name"])
      t1_id ||= Team.find_by(name: game["teams"]["t1"]["name"]).id
      t2_id ||= Team.find_by(name: game["teams"]["t2"]["name"]).id
      game_id = Game.create(date: dt, game_number: game["number"], home_id: t1_id, away_id: t2_id).id
    end

    if game.has_key?("teams") && game["teams"].has_key?("t1") && game["teams"]["t1"].has_key?("players")
      game["teams"]["t1"]["players"].each do |key, player|
        add_performance player, game["teams"]["t1"]["name"], game_id
      end
    end
    if game.has_key?("teams") && game["teams"].has_key?("t2") && game["teams"]["t2"].has_key?("players")
      game["teams"]["t2"]["players"].each do |key, player|
        add_performance player, game["teams"]["t2"]["name"], game_id
      end
    end

  end
end







