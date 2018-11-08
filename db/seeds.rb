# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Game.destroy_all

puts 'Creating games...'
games_attributes = [
  {
    title:         'Dirreciones',
    photo:          'https://res.cloudinary.com/dsclisbti/image/upload/v1541619453/photo-1527612820672-5b56351f7346.jpg',
  },
  {
    title:         'Sokoban',
    photo:         'https://res-console.cloudinary.com/dsclisbti/thumbnails/v1/image/upload/v1541618821/cGhvdG8tMTUzMDMyODQxMTA0Ny03MDYzZGJkMjkwMjk=/grid',
  },
  {
    title:         'GalaXe',
    photo:         'https://res-console.cloudinary.com/dsclisbti/thumbnails/v1/image/upload/v1541618845/cGhvdG8tMTUyMjMwODcxNTA0NC02MDNlYzZkMjZjZWQ=/grid',
  },
  {
    title:         'Mi Casa',
    photo:         'https://res-console.cloudinary.com/dsclisbti/thumbnails/v1/image/upload/v1541618907/aW1hZ2Vz/grid',
  },
  {
    title:         'Globo',
    photo:         'https://res-console.cloudinary.com/dsclisbti/thumbnails/v1/image/upload/v1541619256/cGhvdG8tMTUxODMzMTY0NzYxNC03YTFmMDRjZDM0Y2Y=/grid',
  },
  {
    title:         'Dice',
    photo:          'https://res-console.cloudinary.com/dsclisbti/thumbnails/v1/image/upload/v1541619453/cGhvdG8tMTUyNzYxMjgyMDY3Mi01YjU2MzUxZjczNDY=/grid',
  },
  {
    title:         'Robots',
    photo:         'https://res-console.cloudinary.com/dsclisbti/thumbnails/v1/image/upload/v1541619453/cGhvdG8tMTUyNzYxMjgyMDY3Mi01YjU2MzUxZjczNDY=/grid',
  },
  {
    title:         'Extreme Challenge',
    photo:         'https://res-console.cloudinary.com/dsclisbti/thumbnails/v1/image/upload/v1541619542/cGhvdG8tMTUyNjU3MjIwMjA0Ni04Yjg3NjQ0ZGNlNGE=/grid',
  }
]
Game.create!(games_attributes)
puts 'Finished!'
