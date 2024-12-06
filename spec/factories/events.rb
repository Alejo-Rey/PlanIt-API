FactoryBot.define do
  factory :event do
    title { "Evento de prueba" }
    description { "Este es un evento generado por FactoryBot" }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    event_date { Faker::Date.forward(days: 30) }
  end
end