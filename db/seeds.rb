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

  },
  {
    title:         'Pizza East',
    slug:      '56A Shoreditch High St, London E1 6PQ',
  },
  {
    title:         'Dishoom',
    slug:          '7 Boundary St, London E2 7JE',
  },
  {
    title:         'Pizza East',
    slug:      '56A Shoreditch High St, London E1 6PQ',
  },
  {
    title:         'Dishoom',
    slug:          '7 Boundary St, London E2 7JE',
  },
  {
    title:         'Pizza East',
    slug:      '56A Shoreditch High St, London E1 6PQ',
  },
  {
    title:         'Dishoom',
    slug:          '7 Boundary St, London E2 7JE',
  },
  {
    title:         'Pizza East',
    slug:      '56A Shoreditch High St, London E1 6PQ',
  }
]
Game.create!(games_attributes)
puts 'Finished!'
