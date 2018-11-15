puts 'Cleaning database...'
User.destroy_all
Game.destroy_all

puts 'Creating users'
User.create!(
  email: 'user@user.com',
  password: 123456
)

puts 'Creating games...'
games_attributes = [
  {
    title:         'Debugging',
    photo:          'https://res.cloudinary.com/dsclisbti/image/upload/v1541619453/photo-1527612820672-5b56351f7346.jpg',
  },
  {
    title:         'Sokoban',
    photo:         'https://res.cloudinary.com/dsclisbti/image/upload/v1541619542/photo-1526572202046-8b87644dce4a.jpg',
  },
  {
    title:         'GalaXe',
    photo:         'https://res.cloudinary.com/dsclisbti/image/upload/v1541618845/photo-1522308715044-603ec6d26ced.jpg',
  },
  {
    title:         'Robots',
    photo:         'https://res.cloudinary.com/dsclisbti/image/upload/v1541619256/photo-1518331647614-7a1f04cd34cf.jpg',
  },
  {
    title:         'Globo',
    photo:         'https://res.cloudinary.com/dsclisbti/image/upload/v1541619417/photo-1529978755210-7f13333beb13.jpg',
  },
  {
    title:         'Extreme Challenge',
    photo:         'https://res.cloudinary.com/dsclisbti/image/upload/v1541619542/photo-1526572202046-8b87644dce4a.jpg',
  }
]
Game.create!(games_attributes)


boards = [
  [
    %w[robot empty empty wall wall empty],
    %w[hole hole empty empty empty empty],
    %w[empty empty empty empty empty empty],
    %w[empty empty empty empty hole empty],
    %w[wall empty empty wall empty empty],
    %w[empty empty empty empty hole empty]
  ],
  [
    %w[robot empty empty wall wall empty],
    %w[hole hole empty empty empty empty],
    %w[empty empty empty empty empty empty],
    %w[empty empty empty empty hole empty],
    %w[wall empty empty wall empty empty],
    %w[empty empty empty empty hole empty]
  ],
  [
    %w[robot empty empty wall wall empty],
    %w[hole hole empty empty empty empty],
    %w[empty empty empty empty empty empty],
    %w[empty empty empty empty hole empty],
    %w[wall empty empty wall empty empty],
    %w[empty empty empty empty hole empty]
  ],
  [
    %w[robot empty empty wall wall empty],
    %w[hole hole empty empty empty empty],
    %w[empty empty empty empty empty empty],
    %w[empty empty empty empty hole empty],
    %w[wall empty empty wall empty empty],
    %w[empty empty empty empty hole empty]
  ],
  [
    %w[robot empty empty wall wall empty],
    %w[hole hole empty empty empty empty],
    %w[empty empty empty empty empty empty],
    %w[empty empty empty empty hole empty],
    %w[wall empty empty wall empty empty],
    %w[empty empty empty empty hole empty]
  ],
]



puts 'Creating levels...'
Game.all.each do |game|
  boards.each do |board|
    Level.create!(
      game: game,
      board: board
    )
  end
end

puts 'Finished!'
