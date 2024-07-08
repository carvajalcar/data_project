require 'faker'

# Clear existing data
puts "Clearing existing data..."
GamePlayer.destroy_all
Statistic.destroy_all
Game.destroy_all
Player.destroy_all
Classification.destroy_all
Team.destroy_all

puts "Creating teams..."

# Track used team names to avoid duplicates
used_team_names = Set.new

# Create teams
10.times do |i|
  # Generate a unique team name
  team_name = nil
  loop do
    team_name = Faker::Sports::Basketball.unique.team
    break unless used_team_names.include?(team_name)
  end
  used_team_names << team_name

  team = Team.create!(
    name: team_name,
    city: Faker::Address.city
  )

  # Create classification for each team
  Classification.create!(
    team: team,
    wins: Faker::Number.between(from: 0, to: 82),
    losses: Faker::Number.between(from: 0, to: 82)
  )
end

puts "Creating players and statistics..."

# Create players and statistics
Team.all.each do |team|
  15.times do
    player = team.players.create!(
      name: Faker::Sports::Basketball.player,
      position: %w[Guard Forward Center].sample
    )

    # Create statistics for each player
    Statistic.create!(
      points: Faker::Number.between(from: 0, to: 40),
      rebounds: Faker::Number.between(from: 0, to: 20),
      assists: Faker::Number.between(from: 0, to: 15),
      player: player
    )
  end
end

puts "Creating games and associating players..."

# Create games and game players
Player.all.each_slice(10) do |players|
  game = Game.create!(
    date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    location: Faker::Address.city
  )

  players.each do |player|
    GamePlayer.create!(
      game: game,
      player: player
    )
  end
end

puts "Seeding completed successfully."
