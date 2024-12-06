# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "📅 Creando eventos..."

# users = User.all

Event.create!(
  [
    {
      title: "Conferencia Ruby on Rails",
      description: "Un evento para aprender sobre Rails.",
      latitude: 4.711,
      longitude: -74.072,
      event_date: DateTime.now + 7.days,
      # creator: users.sample
    },
    {
      title: "Hackathon 2024",
      description: "Evento para construir soluciones innovadoras.",
      latitude: 4.609,
      longitude: -74.081,
      event_date: DateTime.now + 30.days,
      # creator: users.sample
    },
    {
      title: "Reunión de startups",
      description: "Encuentro para hacer networking.",
      latitude: 4.656,
      longitude: -74.117,
      event_date: DateTime.now + 15.days,
      # creator: users.sample
    }
  ]
)

puts "✔️ Eventos creados exitosamente."