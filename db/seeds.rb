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
    title:         'Procedural Thinking',
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

r = 'robot'
_ = 'empty'
w = 'wall'
o = 'hole'
f = 'finish'

boards = [
  [
    [r, o, f],
    [_, o, _],
    [_, _, _],
  ],
  [
    [r, _, _, _],
    [w, _, w, o],
    [_, _, _, _],
    [_, w, o, f],
  ],
  [
    [r, _, _, _, _],
    [w, w, w, w, _],
    [_, _, _, _, _],
    [_, o, o, o, o],
    [_, _, _, _, f],
  ],
  [
    [r, _, _, _, _, _],
    [_, _, _, _, _, _],
    [_, _, _, _, _, _],
    [_, _, _, _, _, _],
    [_, _, _, _, _, _],
    [_, _, _, _, _, _],
  ],
  [
    [r, _, _, _, _, _, _],
    [_, _, _, _, _, _, _],
    [_, _, _, _, _, _, _],
    [_, _, _, _, _, _, _],
    [_, _, _, _, _, _, _],
    [_, _, _, _, _, _, _],
    [_, _, _, _, _, _, _],
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
